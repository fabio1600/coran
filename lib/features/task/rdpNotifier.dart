
import 'dart:io';
import 'dart:typed_data';

import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/utente.dart';
import 'package:path_provider/path_provider.dart';
import 'filtriNotifier.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';



final providerRdp =
    StateNotifierProvider<Rdpnotifier, List<Rdp>>(
  (ref) {
    final box = Hive.box<Rdp>('rdp'); // box già aperta nel main
    return Rdpnotifier (box);
  },
);


class Rdpnotifier extends StateNotifier<List<Rdp>> {
    final Box<Rdp> box;

    Rdpnotifier(this.box) : super(box.values.toList());

    void addRdp(Rdp rdp){
     
      final exists = state.indexWhere((e) => e.id == rdp.id);
      if(exists != -1){
        box.put(rdp.id,rdp);
        state = state.where((e) => e.id != rdp.id).toList();
        
      state=[...state,rdp];
      }else{
      box.put(rdp.id, rdp);
      state=[...state,rdp];
      }
      
    }

    void setLetto(Rdp rdp){
      var nuovoRdp=rdp.copyWith(letto: true);
      box.put(nuovoRdp.id,nuovoRdp);
        state = state.where((e) => e.id != nuovoRdp.id).toList();
        
      state=[...state,nuovoRdp];
    }
    
    bool getPositivi(List<int> lista){
      var listaRdp=state.where((a)=>lista.contains(a.id)).toList();
      if(listaRdp.any((a)=>(a.positivo==true&&a.letto==false))){
        return true;
      }else{
        return false;
      }
    }
    
  Future<void> downloadPdf(Uint8List pdfBytes,String nome,Rdp rdp) async {
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
      var nuovoRdp=rdp.copyWith(pathPdf: nome);
      box.put(rdp.id, nuovoRdp);
      state = state.where((e) => e.id != nuovoRdp.id).toList();
        
      state=[...state,nuovoRdp];
    }


    
  } catch (e) {
    print("Errore download: $e");
  }
}
  

  
  
}

