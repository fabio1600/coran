import 'dart:math';

import 'package:coran/features/task/accettazione.dart';
import 'package:coran/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'modello_task.dart';
import '../../core/storage/servizio_preferenze.dart';
import 'package:coran/services/connectivity_service.dart';

/// Provider globale che espone la lista dei task
final providerTask =
    StateNotifierProvider<TaskNotifier, List<Task>>(
  (ref) => TaskNotifier(),
);

/// Notifier che gestisce lo stato dei task
class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]) {
    _caricaTask();
  }

  

  /// Carica i task salvati all'avvio
  Future<void> _caricaTask() async {

    // 👆 se usi emulator Android
    // se usi telefono fisico -> metti IP del tuo PC

    
    final taskSalvati = await ServizioPreferenze.caricaTask();
    state = taskSalvati;
  }

  Task getTask(int id)  {

    // 👆 se usi emulator Android
    // se usi telefono fisico -> metti IP del tuo PC

    Task task=Task(id: 0, titolo: '', scadenza: DateTime.now());
    final taskSalvati = state;
    for(Task t in taskSalvati){
      if(t.id==id){
         task=t;
      }
    }
    return task;
  }

  /// Aggiunge un nuovo task
  void aggiungiTask(String titolo, DateTime scadenza) {
    final nuovoTask = Task(
      id:  Random().nextInt(100),
      titolo: titolo,
      scadenza: scadenza,
    );

    state = [...state, nuovoTask];
    
    ServizioPreferenze.salvaTask2(nuovoTask);
  }

  /// Cambia lo stato completato / non completato
  void toggleCompletato(int id) {
    state = [
      for (final task in state)
        if (task.id == id)
          task.copiaCon(completato: !task.completato)
        else
          task
    ];

    ServizioPreferenze.salvaTask(state);
  }

  /// Elimina un task
  void eliminaTask(int id) {
    state = state.where((task) => task.id != id).toList();
    ServizioPreferenze.salvaTask(state);
  }


  void ordinaTaskCresc(){
    List<Task> listaTask= state.toList();
      listaTask.sort((a, b) => a.scadenza.compareTo(b.scadenza));
      state=listaTask;
  }

  void ordinaTaskDecresc(){
    List<Task> listaTask= state.toList();
      listaTask.sort((a, b) => b.scadenza.compareTo(a.scadenza));
      state=listaTask;
  }

  void ordinaTask(){
    List<Task> listaNuova= state.toList();
    listaNuova.sort((a,b)=> a.titolo[0].compareTo(b.titolo[0]));
    state= listaNuova;
  }

  void ordinaCompletati(){
    List<Task> listaTask= state.toList();
    listaTask.sort((a,b)=> b.completato.hashCode.compareTo(a.completato.hashCode));
    state=listaTask;
  }

  void modificaTask(Task task){
    List<Task> lista=state.toList();
    for(Task t in lista){
      if(t.id==task.id){
        lista.remove(t);
        Task taskModificata=Task(id: task.id, titolo: task.titolo, scadenza: task.scadenza);
        lista.add(taskModificata);

      }
    }
    state= lista;
  }

   
}
void  checkConnection() async {
  bool online = await ConnectivityService.hasInternet();

  if (!online) {
    print("Sei offline");
  }else{
    print("Sei online");
  }
}


