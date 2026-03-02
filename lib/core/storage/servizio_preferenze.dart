import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/task/modello_task.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ServizioPreferenze {
  static const _chiaveTask = 'task_salvati';

  /// Salva la lista dei task
  static Future<void> salvaTask(List<Task> task) async {
       
    final prefs = await SharedPreferences.getInstance();

    final listaJson = task
        .map((t) => jsonEncode(t.toMap()))
        .toList();

    await prefs.setStringList(_chiaveTask, listaJson);
  }

   static Future<void> salvaTask2(Task task) async {
       final url = Uri.parse("http://10.0.2.2:8080/tasks"); 
  
    final prefs = await SharedPreferences.getInstance();

    final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json", // fondamentale
    },
    body: jsonEncode(task.toMap()), // <-- qui passi il JSON
  );
  print("risposta errore: ${response.statusCode}");
  }


  /// Carica la lista dei task
  static Future<List<Task>> caricaTask() async {
        final url = Uri.parse("http://10.0.2.2:8080/tasks"); 
        try{
    final response = await http.get(url);
        
     final List<dynamic> listaJson = jsonDecode(response.body);

     

    final prefs = await SharedPreferences.getInstance();

    final listaString = listaJson
        .map((task) => jsonEncode(task))
        .toList();

    await prefs.setStringList(_chiaveTask, listaString);

    // 🔹 Ritorna lista convertita
    return listaJson
        .map((json) => Task.fromMap(json))
        .toList();
  }on SocketException {
    print("Sei offline");
    return await caricaTaskOffline();
  }

  }

  static Future <List<Task>> caricaTaskOffline() async {
    final prefs = await SharedPreferences.getInstance();
    final listaString = prefs.getStringList(_chiaveTask);

   

    // 🔹 Ritorna lista convertita
    final listaTask = listaString!
      .map((taskJson) => Task.fromMap(jsonDecode(taskJson)))
      .toList();

  return listaTask;
  }
}
