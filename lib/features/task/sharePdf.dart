import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

Future<void> sharePdf(String path) async {
  try {
    final byteData = await rootBundle.load('assets/pdfs/$path.pdf');

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$path.pdf');

    await file.writeAsBytes(
      byteData.buffer.asUint8List(),
      flush: true,
    );

    await Future.delayed(const Duration(milliseconds: 200));

    await Share.shareXFiles(
      [
        XFile(
          file.path,
          mimeType: 'application/pdf',
        ),
      ],
      fileNameOverrides: ['$path.pdf'],
    );
  } catch (e) {
    print("ERRORE SHARE: $e");
  }
}