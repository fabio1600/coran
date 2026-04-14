import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/rdpNotifier.dart';
import 'package:coran/features/task/utente.dart';
import 'test_pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'sharePdf.dart';




class Paginardp extends ConsumerStatefulWidget {
final int id;
final int id2;

  const Paginardp({required this.id,required this.id2});


  @override
  ConsumerState<Paginardp> createState() => _PaginardpState();
}
class _PaginardpState extends ConsumerState<Paginardp> {
  ByteData? pdf;
  bool loading=true;


  

  
  

  Future<void> getPdf() async{
    
    
     Rdp rdp=ref.read(providerRdp).toList().firstWhere((element) => (element.id==widget.id2&&element.idAcc==widget.id));
    final bytes= await rootBundle.load('assets/images/${rdp.pathPdf}');
    downloadPdf(bytes.buffer.asUint8List(),'${rdp.idAcc}-${rdp.id}');
    setState(() {
      
      pdf = bytes;
      loading = false;
     
    });
  }

  Utente? utente;
  
   


 
@override
  void initState() {
    super.initState();
    
    getPdf();
  }

@override
  Widget build(BuildContext context) {
    
     
     Rdp rdp=ref.watch(providerRdp).toList().firstWhere((element) => (element.id==widget.id2&&element.idAcc==widget.id));
    return Scaffold(
      appBar: AppBar(
        title: Text('Rapporto di prova') ,
        centerTitle: true,
        actions :[IconButton(
  icon: Icon(Icons.ios_share),
  onPressed: () {
    sharePdf(rdp.pathPdf!);
  },
)],
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          :   SfPdfViewer.memory(pdf!.buffer.asUint8List()),

          
    
    );
  }


}
