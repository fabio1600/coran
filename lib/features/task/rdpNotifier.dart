
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/utente.dart';
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
    
  
  

  
  
}

