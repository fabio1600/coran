import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

Future<void> sharePdf(String path) async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/rdp/$path.pdf');

  if (!await file.exists()) {
    print("File non trovato");
    return;
  }

  final tempDir = await getTemporaryDirectory();
  final tempFile = File('${tempDir.path}/$path.pdf');

  await tempFile.writeAsBytes(await file.readAsBytes());

  await Share.shareXFiles([XFile(tempFile.path)]);
}