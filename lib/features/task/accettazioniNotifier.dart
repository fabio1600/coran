
import 'dart:io';
import 'dart:typed_data';

import 'package:coran/features/task/Allegato.dart';
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/test_pdf.dart';
import 'package:coran/features/task/utente.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'filtriNotifier.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';



final providerAccettazione =
    StateNotifierProvider<Accettazionenotifier, List<Accettazione>>(
  (ref) {
    final box = Hive.box<Accettazione>('accettazioni'); // box già aperta nel main
    return Accettazionenotifier(box);
  },
);


class Accettazionenotifier extends StateNotifier<List<Accettazione>> {
    final Box<Accettazione> box;

    Accettazionenotifier(this.box) : super(box.values.toList());

    void addAccettazione(Accettazione acc){
      final exists = state.indexWhere((e) => e.id == acc.id);
      if(exists != -1){
        box.put(acc.id,acc);
        state = state.where((e) => e.id != acc.id).toList();
        box.put(acc.id, acc);
      state=[...state,acc];
      }else{
      box.put(acc.id, acc);
      state=[...state,acc];
      }
    }


    void deleteAccettazione(int id){
      box.delete(id);
      state = state.where((e) => e.id != id).toList();
    }

    void modStato(String stato,Accettazione acc){
      var nuovaAcc=acc.copyWith(stato: stato);
      
      box.put(acc.id, nuovaAcc);
      final index = state.indexWhere((e) => e.id == acc.id);

      state = [
    for (final e in state)
      if (e.id == nuovaAcc.id) nuovaAcc else e
  ];
    }

    void setPositivo(Accettazione accettazione){
      var nuovaAcc=accettazione.copyWith(positivo: true);
       box.put(accettazione.id, nuovaAcc);
      final index = state.indexWhere((e) => e.id == accettazione.id);

      state = [
    for (final e in state)
      if (e.id == nuovaAcc.id) nuovaAcc else e
  ];
    }

    List<String> getQuesiti(int? id){
      List<String> lista=['Tutti'];
      for(Accettazione a in box.values){
        if(a.idRichiedente==id&&!lista.contains(a.Quesito)){
          lista.add(a.Quesito);
        }
      }
      return lista;
    }

    void setPreferito(Accettazione acc)async{
      var nuovaAcc;
      if(acc.preferito==false){
      var box2=Hive.box('preferiti');
      box2.put('id', acc.id);
       nuovaAcc=acc.copyWith(preferito: true);
      }else if(acc.preferito==true){
        var box2=Hive.box('preferiti');
        await box2.delete(acc.id);
       nuovaAcc=acc.copyWith(preferito: false);
      }
      
      box.put(acc.id, nuovaAcc);
      final index = state.indexWhere((e) => e.id == acc.id);

      state = [
    for (final e in state)
      if (e.id == nuovaAcc.id) nuovaAcc else e
  ];
    }

    void addAllegati(String? descrizione,int? idAllegato,int anno,int richiesta,Accettazione acc) async{
      var urlPdf= Uri.parse('http://192.168.0.167:8080/pdfAllegati/${idAllegato}/${anno}/${richiesta}');
      String token=Hive.box('login').get('token');
      var risposta = await http.get(
        urlPdf,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      await downloadPdf(risposta.bodyBytes, idAllegato.toString());
      Allegato all=Allegato(descrizione: descrizione, pathAllegato: idAllegato.toString(),idAllegato: idAllegato);
     
      
      if(acc.Allegati==null || !acc.Allegati!.any((a)=>a.idAllegato==all.idAllegato)){
        var nuovaAcc=acc.copyWith( allegati: [...?acc.Allegati, all],);
      box.put(acc.id, nuovaAcc);
      final index = state.indexWhere((e) => e.id == acc.id);

      state = [
    for (final e in state)
      if (e.id == nuovaAcc.id) nuovaAcc else e
  ];
      }
      
    }


Future<void> downloadPdf(Uint8List pdfBytes,String nome) async {
  try {
    // 1️⃣ Carico il PDF dagli assets (simula BLOB)
    

    // 2️⃣ Scelgo la directory
    Directory? dir;

    
    dir = await getApplicationDocumentsDirectory();
    final rdpDir = Directory('${dir.path}/rdp');

    // crea la cartella se non esiste
    if (!await rdpDir.exists()) {
      await rdpDir.create(recursive: true);
    }

    
    // 3️⃣ Creo il file
    final file = File('${dir.path}/rdp/${nome}.pdf');

    if(!await file.exists()){
      await file.writeAsBytes(pdfBytes);
      
    }


    
  } catch (e) {
    print("Errore download: $e");
  }
}
    
    
  
}

