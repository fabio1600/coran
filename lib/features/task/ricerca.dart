import 'package:coran/core/storage/servizio_preferenze.dart';
import 'package:coran/features/task/modello_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'provider_task.dart';
import 'package:coran/core/storage/servizio_preferenze.dart';
import 'scaffoldBase.dart';

class Ricerca extends ConsumerStatefulWidget {


  const Ricerca({super.key});


  @override
  ConsumerState<Ricerca> createState() => _RicercaState();
}
class _RicercaState extends ConsumerState<Ricerca> {

 @override
  Widget build(BuildContext context) {
    bool test=true;

    return Column(
          children: [
            Expanded(child: SingleChildScrollView(child: Column( children: [
            Padding(padding:EdgeInsetsGeometry.only(top: 20)),
            Center(
              child: 
              FractionallySizedBox(
                
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 10) ,
                            child:SizedBox(
                              child: Container(
                                
                                child:ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 251, 253, 253)),
                                onPressed: (){
                                  context.push('/accettazione');
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
                                                        width: 105,
                                                        child: Text('Richiesta',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('2186323/SS',
                                                                      style: TextStyle(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        ),
                                                      SizedBox(
                                                          child: Text('Del',
                                                                      style: TextStyle(fontSize: 15,color: Colors.black54)
                                                                      )
                                                          
                                                        ),
                                                      Expanded( child: Padding(padding:EdgeInsetsGeometry.only(left: 7),
                                                          
                                                        
                                                          child: Text('25/02/2026',
                                                                      style: TextStyle(fontSize: 15,color: Colors.black87)
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
                                                        width: 105,
                                                        child: Text('Quesito',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('PATOLOGIE ANIMALI DA AFFEZIONE - CANE',
                                                                      style: TextStyle(fontSize: 15,color: Colors.black87)
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
                                                        width: 105,
                                                        child: Text('Attività',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('SOCIETA AGRICOLA TRES CORONAS S.S.',
                                                                      style: TextStyle(fontSize: 19,color: Colors.black87)
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
                                                        width: 105,
                                                        child: Text('Codice Aziendale',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('IT052SS299',
                                                                      style: TextStyle(fontSize: 19,color: Colors.black87)
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
                                                        width: 105,
                                                        child: Text('Comune',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('OZIERI',
                                                                      style: TextStyle(fontSize: 19,color: Colors.black87)
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
                                            padding: EdgeInsetsGeometry.only(left: 310,top: 5,bottom: 5),
                                            child:  Row (
                                                    children:[
                                                      Icon(Icons.picture_as_pdf,color: Colors.black,),
                                                      Icon(Icons.attach_file,color: Colors.black,)
                                                      ],
                                                    ),
                                            
                                          )
                                        ),
                                          
                                  ],
                                ),
                                ),
                              )
                              
                            ),
                          ),
                        ),
            ),
            
            
          ],
          
        ),
    ),
    ),],
        );
        
  }

 


}
