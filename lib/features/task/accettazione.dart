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
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

class Accettazione extends ConsumerStatefulWidget {


  const Accettazione({super.key});


  @override
  ConsumerState<Accettazione> createState() => _AccettazioneState();
}
class _AccettazioneState extends ConsumerState<Accettazione> {
 



  
  

 @override
  Widget build(BuildContext context) {
    

    return BaseScaffold(
      
        currentIndex: 2,
        body: Column(
          
          children: [
           Expanded(
            child: SingleChildScrollView(
              child:Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsGeometry.only(left: 11,top:20,bottom: 20),
                              child: Text('ACCETTAZIONE 3562',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.95,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 236, 236, 236)
                              ),
                      
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17,top: 15),
                                  child: Text('DATA ACCETTAZIONE',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17,top: 7),
                                  child: Text('25/02/2026',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(child: 
                                  FractionallySizedBox(
                                    alignment: Alignment.center,
                                    widthFactor: 0.9,
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  ),
                                ),
                        
                    
                      
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17),

                                  child: Text('ATTIVITÀ',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17,top: 7),
                                  child: Text('SOCIETA AGRICOLA TRES CORONAS S.S.',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(child: 
                                  FractionallySizedBox(
                                    alignment: Alignment.center,
                                    widthFactor: 0.9,
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  ),
                                ),
                        
                      
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17),
                                  child: Text('INDIRIZZO',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17,top: 7),
                                  child: Text('TRES CORONAS OZIERI (07014)',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(child: 
                                  FractionallySizedBox(
                                    alignment: Alignment.center,
                                    widthFactor: 0.9,
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  ),
                                ),
                        
                      
                      
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17),
                                  child: Text('RICHIEDENETE',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17,top: 7),
                                  child: Text('SANNA RITA',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(child: 
                                  FractionallySizedBox(
                                    alignment: Alignment.center,
                                    widthFactor: 0.9,
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  ),
                                ),
                        
                      
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17),
                                  child: Text('QUESITO',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17,top: 7,right: 5),
                                  child: Text('TRIC3: RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(child: 
                                  FractionallySizedBox(
                                    alignment: Alignment.center,
                                    widthFactor: 0.9,
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  ),
                                ),
                          
                        
                      
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17),
                                  child: Text('UTENTE',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17,top: 7),
                                  child: Text('A.S.L. 1 SASSARI',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(child: 
                                  FractionallySizedBox(
                                    alignment: Alignment.center,
                                    widthFactor: 0.9,
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  ),
                                ),
                          
                        
                      
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17),
                                  child: Text('CODICE AZIENDA',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17,top: 7),
                                  child: Text('IT052SS299',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(child: 
                                  FractionallySizedBox(
                                    alignment: Alignment.center,
                                    widthFactor: 0.9,
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  ),
                                ),
                          
                        
                      
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17),
                                  child: Text('ASL',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17,top: 7),
                                  child: Text('AUSL 1 - SASSARI / OZIERI',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(child: 
                                  FractionallySizedBox(
                                    alignment: Alignment.center,
                                    widthFactor: 0.9,
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17),
                                  child: Text('ALLEGATI PRESENTI',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 17,top: 7,bottom: 20),
                                  child: Row(children: [ Text(' DOC ACCOMPAGNAMENTO + PAGAMENTO',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),Icon(Icons.download)]),
                                ),
                              ],
                            ),
                    
                          ),
                        ),
                        Row(
                            children: [
                              Padding(
                                padding: EdgeInsetsGeometry.only(left: 11,top: 30,bottom: 10),
                                child: Text('RAPPORTI DI PROVA',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                
            
                        FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 10) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(157, 80, 200, 255)),
                                onPressed: (){
                                  context.push('/rdp');
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
                                                        child: Text('RDP',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('6509',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Conferimento',
                                                            style: TextStyle(fontSize: 17,color:  Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('1',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Tipo',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('MUSCOLO/MUSCOLO SUINO ',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Specie',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('SUINO',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Campioni',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('1',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                              
                                            )
                                          ),
                                          
                                  ],
                                ),
                                ),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 10) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(157, 80, 200, 255)),
                                onPressed: (){},
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
                                                        child: Text('RDP',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('6909',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Conferimento',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('2',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Tipo',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('MUSCOLO/MUSCOLO SUINO ',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Specie',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('SUINO',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Campioni',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('1',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                              
                                            )
                                          ),
                                          
                                  ],
                                ),
                                ),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 10) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(117, 238, 72, 108)),
                                onPressed: (){},
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
                                                        child: Text('RDP',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('7145',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Conferimento',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('3',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Tipo',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('MUSCOLO/MUSCOLO SUINO ',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Specie',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('SUINO',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
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
                                                        child: Text('Campioni',
                                                            style: TextStyle(fontSize: 17,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text('1',
                                                                      style: TextStyle(fontSize: 19,color:Colors.black87)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                              
                                            )
                                          ),
                                          
                                  ],
                                ),
                                ),
                            ),
                          ),
                        ),
                      ],
              
                    ),
                  ),
                ],
              ),
            ),
           ),
          ],
        )
        ,
        

      
    );
  }

 


}
