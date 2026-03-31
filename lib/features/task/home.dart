import 'package:coran/features/task/rdpNotifier.dart';
import 'package:coran/features/task/utente.dart';
import 'package:coran/features/task/utenteNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'filtriNotifier.dart';
import 'accettazioniNotifier.dart';
import 'listaAcc.dart';


class Home extends ConsumerStatefulWidget {


  const Home({super.key});


  @override
  ConsumerState<Home> createState() => _HomeState();
}
class _HomeState extends ConsumerState<Home> {





 @override
  Widget build(BuildContext context) {
  

  Utente utente=ref.watch(providerUtente.notifier).getUtente();
  
  final lista=ref.watch(providerAccettazione).where((acc)=>acc.Richiedente==utente.nome).toList();
  lista.sort((a, b) => b.DataAccettazione.compareTo(a.DataAccettazione));
  lista.take(5).toList();
    
  final rdp=ref.watch(providerRdp);
  final acc=ref.watch(providerAccettazione);
  
    return 
    Column(
          children: [
            Expanded(child: ListView( children: [
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
                      Text(utente.nome!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Padding(padding:EdgeInsets.only(left: 0),child: Row(
                        children: [
                          Icon(Icons.local_hospital,size: 30,),
                          Text(utente.utenzaRiferimento!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
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
            getListaAcc(lista, ref),
          SizedBox(height: 20,)
            
             
            
          ],
          
        
    ),
    ),],
        );
        
  }

 


}
