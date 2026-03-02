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


class Rdp extends ConsumerStatefulWidget {


  const Rdp({super.key});


  @override
  ConsumerState<Rdp> createState() => _RdpState();
}
class _RdpState extends ConsumerState<Rdp> {
  
 
@override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 2,
      body: SfPdfViewer.asset('assets/images/rdp.pdf')
    );
  }


}
