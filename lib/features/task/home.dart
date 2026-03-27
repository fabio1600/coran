
import 'package:coran/features/task/accettazione.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'filtriNotifier.dart';
import 'accettazioniNotifier.dart';


class Home extends ConsumerStatefulWidget {


  const Home({super.key});


  @override
  ConsumerState<Home> createState() => _HomeState();
}
class _HomeState extends ConsumerState<Home> {



 @override
  Widget build(BuildContext context) {
  

  
  
  final lista=ref.watch(providerAccettazione).toList();
  lista.sort((a, b) => b.DataAccettazione.compareTo(a.DataAccettazione));
  lista.take(5).toList();
    

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
                      Text('SANNA RITA',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Padding(padding:EdgeInsets.only(left: 0),child: Row(
                        children: [
                          Icon(Icons.local_hospital,size: 30,),
                          Text('ASL 1 SASSARI',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                        ],
                      ),
                      ),
                      Padding(padding: EdgeInsets.only(top:5),child: Row(
                        children: [
                          Icon(Icons.location_on,size: 30,),
                           Expanded(child: Text('DISTRETTO SASSARI',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)))
                        ],
                      ),),
                      
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: lista.length,
              itemBuilder:(context, index) {
              final item = lista[index];
              return Center( 
              child: 
              FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 5) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:item.stato=='Non letto'?  ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 80, 200, 255)) : item.stato=='Letto' ? ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 197, 207, 213)) : ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(117, 238, 72, 108)),
                                onPressed: (){
                                  
                                  context.push('/accettazione/${item.id}');
                                  ref.read(providerAccettazione.notifier).modStato('Letto',item);
                                },
                                onLongPress: (){
                                  ref.read(providerFiltri.notifier).setPreferito();
                                },
                                child: Column(
                                  children: [ 
                                        
                                        Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10),
                                            child: Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Richiesta',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${item.id}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        ),
                                                      Row (
                                                          mainAxisSize: MainAxisSize.min,
                                                          children:[
                                                            Icon(ref.watch(providerFiltri).icona,color: Colors.black,)
                                                          ]
                                                        )
                                                      ]
                                                    )
                                          )
                                        ),
                                      Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10),
                                            child: Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Data Accettazione',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${DateFormat('dd/MM/yyyy').format(item.DataAccettazione)}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                          )
                                        ),
                                    
                                    Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10),
                                            child: Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Quesito',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${item.Quesito}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                          )
                                        ),
                                    Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10),
                                            child: Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Attività',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${item.Attivita}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                          )
                                        ),
                                    Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10,bottom: 10),
                                            child:Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Codice Aziendale',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${item.CodiceAzienda}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                              
                                            )
                                          ),
                                          Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10,bottom: 10),
                                            child:Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Comune',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${item.Comune}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                              
                                            )
                                          ),
                                          Align(
                                          alignment: AlignmentGeometry.centerRight,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(top: 0,bottom: 5),
                                            child:  Row (
                                              mainAxisSize: MainAxisSize.min,
                                                    children:[
                                                      item.RapportiDiProva !=null ? Icon(Icons.picture_as_pdf,color: Colors.black,) : Text('Analisi in corso...',style: TextStyle(color: Colors.black),),
                                                      item.Allegati!=null ? Icon(Icons.attach_file,color: Colors.black,) : SizedBox.shrink()
                                                      ],
                                                    ),
                                          
                                          )
                                        ),
                                          
                                  ],
                                ),
                                ),
                            ),
                          ),
                        ),
            );
              }
            ),
          SizedBox(height: 20,)
            
             
            
          ],
          
        
    ),
    ),],
        );
        
  }

 


}
