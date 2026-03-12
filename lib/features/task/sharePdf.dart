import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

Future<void> sharePdf() async {
  final byteData = await rootBundle.load('assets/images/rdp.pdf');

  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/rdp.pdf');

  

  if (!await file.exists()) {
  await file.writeAsBytes(byteData.buffer.asUint8List());
}

  await Share.shareXFiles([XFile(file.path)]);
}