
import 'package:coran/features/task/accettazione.dart';
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

    
    
  
}

