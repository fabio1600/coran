
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/utente.dart';
import 'filtriNotifier.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';



final providerUtente =
    StateNotifierProvider<Utentenotifier, List<Utente>>(
  (ref) {
    final box = Hive.box<Utente>('utente'); // box già aperta nel main
    return Utentenotifier (box);
  },
);


class Utentenotifier extends StateNotifier<List<Utente>> {
    final Box<Utente> box;

    Utentenotifier(this.box) : super(box.values.toList());

    void addUtente(Utente utente){
     
      final exists = state.indexWhere((e) => e.id == utente.id);
      if(exists != -1){
        box.put(utente.id,utente);
        state = state.where((e) => e.id != utente.id).toList();
        
      state=[...state,utente];
      }else{
      box.put(utente.id, utente);
      state=[...state,utente];
      }
    }
    
    
  
  Utente getUtente(){
    int? id;
    Utente? utente;
    var box=Hive.box('login');
    var box2=Hive.box<Utente>('utente');

    id=box.get('utente');
    utente=box2.get(id);
    return utente!;
  }

  void modificaDati(String cellulare,String telefono,String codiceFiscale,Utente utente){
    var utenteMod= utente.copyWith(cellulare: cellulare,telefono: telefono,codiceFiscale: codiceFiscale);
    box.put(utenteMod.id,utenteMod);
        state = state.where((e) => e.id != utenteMod.id).toList();
        
      state=[...state,utenteMod];
  }

  void modificaPassword(String password,Utente utente){
    var utenteMod= utente.copyWith(password: password);
    box.put(utenteMod.id,utenteMod);
        state = state.where((e) => e.id != utenteMod.id).toList();
        
      state=[...state,utenteMod];

  }
  
}

