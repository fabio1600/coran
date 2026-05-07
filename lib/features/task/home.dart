import 'dart:convert';

import 'package:coran/features/task/Allegato.dart';
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/rdpNotifier.dart';
import 'package:coran/features/task/utente.dart';
import 'package:coran/features/task/utenteNotifier.dart';
import 'package:coran/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'filtriNotifier.dart';
import 'accettazioniNotifier.dart';
import 'listaAcc.dart';
import 'package:http/http.dart' as http;

class Home extends ConsumerStatefulWidget {


  const Home({super.key});


  @override
  ConsumerState<Home> createState() => _HomeState();
}
class _HomeState extends ConsumerState<Home> {


Future<void> caricaAnalisi()async{

  var token=Hive.box('login').get('token');
  var url = Uri.parse('http://192.168.0.167:8080/analisi');
  bool risultato= await ConnectivityService.hasInternet();   
  if(risultato==false){                 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: const Text("Non connesso ad internet!",style: TextStyle(fontSize: 16),),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
    return;
  }
  var risposta = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );
  
  if(risposta.statusCode==200){
    List<dynamic> data = jsonDecode(risposta.body);
    var listaCompleta=ref.read(providerAccettazione).toList();    
    for(var A in data){
      
        Accettazione acc=Accettazione.fromJson(A);
        
        var urlAllegati= Uri.parse('http://192.168.0.167:8080/allegati/${acc.id}/${acc.DataAccettazione.year}');
        var rispostaAllegati = await http.get(
          urlAllegati,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );
        List< dynamic> dataAllegati = jsonDecode(rispostaAllegati.body);

        var urlRdp=Uri.parse('http://192.168.0.167:8080/rdp/${acc.DataAccettazione.year}/${acc.id}');
        var rispostaRdp= await http.get(
          urlRdp,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );
        List< dynamic> dataRdp = jsonDecode(rispostaRdp.body);
        
        if(!listaCompleta.any((a)=>a.id==acc.id)){
            acc=acc.copyWith(idRichiedente: Hive.box('login').get('utente'));
            for(var r in dataRdp){
              
              if(r['rapportoprovan']!=null){
                
                Rdp rdp=Rdp.fromJson(r);
              
                await ref.read(providerRdp.notifier).addRdp(rdp,acc);
                var listaRdp=ref.read(providerRdp).toList().where((r)=>r.idAcc==acc.id);
                List<int> lista= listaRdp.map((e) => e.id).toList();
                 acc=acc.copyWith(RapportiDiProva: lista);
              }
              
              
            }
            for(var all in dataAllegati){
              Allegato allegato= Allegato.fromJson(all);
              ref.read(providerAccettazione.notifier).addAllegati(allegato.descrizione, allegato.idAllegato, acc.DataAccettazione.year, acc.id, acc);
            }
            
               
            ref.read(providerAccettazione.notifier).addAccettazione(acc);
      }else if(listaCompleta.any((a)=>a.id==acc.id)){

        Accettazione updateAcc= listaCompleta.firstWhere((a)=>a.id==acc.id).updateFromJson(A);
        if(!(listaCompleta.firstWhere((a)=>a.id==acc.id)==updateAcc)){
          for(var r in dataRdp){
            
              if(r['rapportoprovan']!=null){
                
                Rdp rdp=Rdp.fromJson(r);
                if(listaCompleta.any((a)=>( a.id==rdp.idAcc&& ((a.RapportiDiProva!=null &&   !a.RapportiDiProva!.any((b)=>b==rdp.id))||a.RapportiDiProva==null)))){
                await ref.read(providerRdp.notifier).addRdp(rdp,updateAcc);
                var listaRdp=ref.watch(providerRdp).toList().where((r)=>r.idAcc==acc.id);
                List<int> lista= listaRdp.map((e) => e.id).toList();
                updateAcc=updateAcc.copyWith(RapportiDiProva: lista);
              }
              }
              
              
            }
        for(var all in dataAllegati){
          Allegato allegato= Allegato.fromJson(all);
              ref.read(providerAccettazione.notifier).addAllegati(allegato.descrizione, allegato.idAllegato, updateAcc.DataAccettazione.year, updateAcc.id, updateAcc);
            }
          
        ref.read(providerAccettazione.notifier).addAccettazione(updateAcc);
        }
        
      
      }
        
      
    }
  }else if(risposta.statusCode==403){
    print("Errore 403 scaduto token");
  }
    
    
}





 @override
  Widget build(BuildContext context) {
  var box=Hive.box<Accettazione>('accettazioni');
  


  Utente utente=ref.watch(providerUtente.notifier).getUtente();

  
  
  
  final lista=ref.watch(providerAccettazione).where((acc)=>acc.idRichiedente==utente.id).toList();
  lista.sort((a, b) => b.DataAccettazione.compareTo(a.DataAccettazione));
  final lista_finale=lista.take(5).toList();
    
  final rdp=ref.watch(providerRdp);
  
  
  final acc=ref.watch(providerAccettazione);
  
  
    return 
    Column(
        children: [
          Expanded(child:RefreshIndicator(
            onRefresh: caricaAnalisi, 
            child: ListView( children: [
              
            Center(
            child: Padding(padding: EdgeInsets.only(top: 20),child: FractionallySizedBox(
              widthFactor: 0.95,
              child: SizedBox(
                height: 230,
                child: Card(
                  elevation: 3,
                  child: Padding(padding: EdgeInsets.all(16),child: Column(
                    children: [
                      Icon(Icons.account_box,size: 75),
                      Text(utente.nome!.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                       Padding(padding:EdgeInsets.only(left: 0),child: Row(
                        children: [
                          Icon(Icons.local_hospital,size: 30,),
                          SizedBox(width: 10,),
                          Expanded(child:Text(utente.utenzaRiferimento!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)))
                          
                        ],
                      ),
                      ),
                      
                      
                      utente.distretto!=null ?
                      Padding(padding: EdgeInsets.only(top:5),child: Row(
                        children: [
                          Icon(Icons.location_on,size: 30,),
                           Expanded(child: Text(utente.distretto!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)))
                        ],
                      ),): SizedBox.shrink()
                      
                    ],
                  ),
                  ),
                ),
              ),
              
            )),),
            
            FractionallySizedBox(
              widthFactor: 0.95,
            child: Padding(
              padding: EdgeInsets.only(top: 30,bottom:10,),
              child: Align(
                alignment: Alignment.centerLeft,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.history),
                        SizedBox(width: 8),
                        Text('ACCETTAZIONI RECENTI',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ]
                ) 
              )
            ),),
            getListaAcc(lista_finale, ref),
          SizedBox(height: 20,)
            
             
            
          ],
          
        
    ),
            )
             
    ),],
        );
        
  }

 


}
