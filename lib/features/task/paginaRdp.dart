import 'package:coran/core/storage/servizio_preferenze.dart';
import 'package:coran/features/task/modello_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'provider_task.dart';
import 'package:coran/core/storage/servizio_preferenze.dart';
import 'scaffoldBase.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:typed_data';
import 'dart:io';
import 'test_pdf.dart';
import 'sharePdf.dart';



class Paginardp extends ConsumerStatefulWidget {


  const Paginardp({super.key});


  @override
  ConsumerState<Paginardp> createState() => _PaginardpState();
}
class _PaginardpState extends ConsumerState<Paginardp> {
  ByteData? pdf;
  bool loading=true;


  Future<void> getPdf() async{
    final bytes= await rootBundle.load('assets/images/rdp2.pdf');
    setState(() {
      
      pdf = bytes;
      loading = false;
     
    });
  }
   
 
@override
  void initState() {
    super.initState();
    getPdf();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rapporto di prova'),
        centerTitle: true,
        actions :[IconButton(
  icon: Icon(Icons.ios_share),
  onPressed: () {
    sharePdf();
  },
)],
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          :   SfPdfViewer.memory(pdf!.buffer.asUint8List()),
    
    );
  }


}
