import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

Future<void> sharePdf(String path) async {
  final byteData = await rootBundle.load('assets/images/${path}');

  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/${path}');

  

  if (!await file.exists()) {
  await file.writeAsBytes(byteData.buffer.asUint8List());
}

  await Share.shareXFiles([XFile(file.path)]);
}