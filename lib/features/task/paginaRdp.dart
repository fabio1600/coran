import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'sharePdf.dart';
import 'package:coran/services/connectivity_service.dart';



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
        title: Text('Rapporto di prova') ,
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
