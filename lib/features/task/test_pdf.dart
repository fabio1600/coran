import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

Future<void> downloadPdf() async {
  try {
    // 1️⃣ Carico il PDF dagli assets (simula BLOB)
    final data = await rootBundle.load('assets/images/rdp.pdf');
    final Uint8List pdfBytes = data.buffer.asUint8List();

    // 2️⃣ Scelgo la directory
    Directory? dir;

    if (Platform.isAndroid) {
      dir = Directory('/storage/emulated/0/Download');
    } else {
      dir = await getApplicationDocumentsDirectory();
    }

    // 3️⃣ Creo il file
    final file = File('${dir.path}/miofile.pdf');

    // 4️⃣ Scrivo i bytes
    await file.writeAsBytes(pdfBytes);

    print("PDF salvato in: ${file.path}");
  } catch (e) {
    print("Errore download: $e");
  }
}