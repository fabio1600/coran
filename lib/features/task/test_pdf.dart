import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';



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