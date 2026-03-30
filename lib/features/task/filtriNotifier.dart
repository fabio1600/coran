
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/filtriRicerca.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


/// Provider globale che espone la lista dei task
final providerFiltri =
    StateNotifierProvider<Filtrinotifier, filtriRicerca>(
  (ref) => Filtrinotifier(),
);

/// Notifier che gestisce lo stato dei task
class Filtrinotifier extends StateNotifier<filtriRicerca> {
  Filtrinotifier() : super(filtriRicerca());

  void setVet(String vet){
    state= state.copyWith(veterinario: vet);
  }

  void clearVet(){
    state= state.copyWith(clearVet: true);
  }
  TextEditingController vetController = TextEditingController();


  void setRich(String richiesta){
    state= state.copyWith(richiesta: richiesta);
  }

  void clearRich(){
    state= state.copyWith(clearRich: true);
  }
  TextEditingController richController = TextEditingController();
  

  void setCod(String cod){
    state= state.copyWith( codiceAziendale: cod);
  }

  void clearCod(){
    state= state.copyWith(clearCod: true);
  }
  TextEditingController codController = TextEditingController();

  void setRag(String ragioneSociale){
    state= state.copyWith(ragioneSociale: ragioneSociale);
  }

  void clearRag(){
    state= state.copyWith(clearRag: true);
  }
  TextEditingController ragController = TextEditingController();

  void setQue(String quesito){
    state= state.copyWith(quesito: quesito);
  }

  void clearQue(){
    state= state.copyWith(clearQue: true);
  }
  TextEditingController queController = TextEditingController();

  void setVerb(String verbale){
    state= state.copyWith(verbale: verbale);
  }

  void clearVerb(){
    state= state.copyWith(clearVerb: true);
  }
  TextEditingController verbController = TextEditingController();
  
  void setAccdal (DateTime accDal){
    state= state.copyWith(accDal: accDal);
  }

  void clearAccDal(){
    state=state.copyWith(clearAccDal: true);
  }

TextEditingController accDalController = TextEditingController();

  void setAccAl (DateTime accAl){
    state= state.copyWith(accAl: accAl);
  }

  void clearAccAl(){
    state=state.copyWith(clearAccAl: true);
  }

TextEditingController accAlController = TextEditingController();

void setRdpDal (DateTime rdpDal){
    state= state.copyWith(rdpDal: rdpDal);
  }

  void clearRdpDal(){
    state=state.copyWith(clearRdpDal: true);
  }

TextEditingController rdpDalController = TextEditingController();

void setRdpAl (DateTime rdpAl){
    state= state.copyWith(rdpAl: rdpAl);
  }

  void clearRdpAl(){
    state=state.copyWith(clearRdpAl: true);
  }

TextEditingController rdpAlController = TextEditingController();

void setPreferito() {
  state = state.copyWith(
    icona: state.icona == Icons.star_border
        ? Icons.star
        : Icons.star_border,
  );
}

void setOrdine(String ordine){
  state=state.copyWith(ordine: ordine);
}
  
void setStato(String stato){
  if(stato=="Positivo"){
    state=state.copyWith(positivo: true);
  }else{
    state=state.copyWith(stato: stato);
  }
  
}

void clearStato(){
  if(state.positivo==true){
    state=state.copyWith(positivo: false);
  }else{
    state=state.copyWith(clearStato: true);
  }
  
}

}

