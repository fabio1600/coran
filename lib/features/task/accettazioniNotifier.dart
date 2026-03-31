
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/utente.dart';
import 'package:flutter/material.dart';
import 'filtriNotifier.dart';

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

    List<String> getQuesiti(String? nomeRichiedente){
      List<String> lista=['Tutti'];
      for(Accettazione a in box.values){
        if(a.Richiedente==nomeRichiedente&&!lista.contains(a.Quesito)){
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

    
    
  
}

