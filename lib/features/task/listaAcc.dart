import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/rdpNotifier.dart';
import 'package:coran/features/task/utente.dart';
import 'package:coran/features/task/utenteNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'filtriNotifier.dart';
import 'accettazioniNotifier.dart';


ListView getListaAcc(List<Accettazione> lista,WidgetRef ref){
  var acc=ref.watch(providerAccettazione);
  return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: lista.length,
              itemBuilder:(context, index) {
              final item = lista[index];
              final positivi=ref.watch(providerRdp.notifier).getPositivi(item.RapportiDiProva!);
              return Center( 
              child: 
              FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 5) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                
                                style:(positivi ==true&&item.stato=='Non letto') ? ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(117, 238, 72, 108)): (positivi ==false&&item.stato=='Non letto')?  ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 80, 200, 255))  : ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 197, 207, 213)),
                                onPressed: (){
                                  
                                  context.push('/accettazione/${item.id}');
                                  
                                  
                                },
                                onLongPress: (){
                                  ref.watch(providerAccettazione.notifier).setPreferito(item);
                                  if(item.preferito==true){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.blue,
                                        content: const Text("Rimosso dai preferiti!",style: TextStyle(fontSize: 16),),
                                        behavior: SnackBarBehavior.floating,
                                        margin: const EdgeInsets.all(20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        duration: const Duration(seconds: 3),
                                      ),
                                  );
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.blue,
                                        content: const Text("Aggiunto ai preferiti!",style: TextStyle(fontSize: 16),),
                                        behavior: SnackBarBehavior.floating,
                                        margin: const EdgeInsets.all(20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        duration: const Duration(seconds: 3),
                                      ),
                                  );
                                  }
                                    
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
                                                            item.preferito==true? Icon(Icons.star,color: Colors.black,) : Icon(Icons.star_border,color: Colors.black,)
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
                                                      item.positivo==true ? Icon(Icons.error_outline,color: Colors.black,) : SizedBox.shrink(),
                                                      item.RapportiDiProva!.isNotEmpty ? Icon(Icons.picture_as_pdf,color: Colors.black,) : Text('Analisi in corso...',style: TextStyle(color: Colors.black87,fontSize: 16),),
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
            );
}