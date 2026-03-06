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


class Rdp extends ConsumerStatefulWidget {


  const Rdp({super.key});


  @override
  ConsumerState<Rdp> createState() => _RdpState();
}
class _RdpState extends ConsumerState<Rdp> {
  
 
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rapporto di prova'),
        centerTitle: true,
        
      ),
      body: Column( 
        children: [
          Padding(padding: EdgeInsetsGeometry.only(left: 300), child: ElevatedButton(onPressed: (){downloadPdf();}, child:  Icon(Icons.download))),
        Expanded(
        
          child: 
         SfPdfViewer.asset('assets/images/rdp.pdf'),
        ),]
    ),
    
    );
  }


}
