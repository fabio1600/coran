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

class Home extends ConsumerStatefulWidget {


  const Home({super.key});


  @override
  ConsumerState<Home> createState() => _HomeState();
}
class _HomeState extends ConsumerState<Home> {

 @override
  Widget build(BuildContext context) {
    bool test=true;

    return 
    Column(
          children: [
            Expanded(child: SingleChildScrollView(child: Column( children: [
            Center(
            child: FractionallySizedBox(
              widthFactor: 0.95,
              
              child: Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(top: 20,bottom: 15),
                  child:Column(
                    children: [Container(
                        alignment: Alignment.centerLeft,
                        child: Text('DISI FABIO - ASL 1 - SASSARI - B',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      
                    ],
                  )
                ),
              ),
            )),
            Center( 
              child: 
              FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 10) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 80, 200, 255)),
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
                                                        width: 120,
                                                        child: Text('Richiesta',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('2186323/SS',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        ),
                                                      
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
                                                          child: Text('25/02/2026',
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
                                                          child: Text('PATOLOGIE ANIMALI DA AFFEZIONE - CANE',
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
                                                          child: Text('SOCIETA AGRICOLA TRES CORONAS S.S.',
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
                                                          child: Text('IT052SS299',
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
                                                          child: Text('OZIERI',
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
                                                      Icon(Icons.picture_as_pdf,color: Colors.black,),
                                                      Icon(Icons.attach_file,color: Colors.black,)
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
            ),
             Center( 
              child: 
              FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 10) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 197, 207, 213)),
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
                                                        width: 120,
                                                        child: Text('Richiesta',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('2186003/SS',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        ),
                                                      
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
                                                        child: Text('Data accettazione',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('02/02/2026',
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
                                                          child: Text('TRIC3: RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',
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
                                                          child: Text('SINI SALVATORE',
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
                                                          child: Text('IT052SS862',
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
                                                          child: Text('OTTANA',
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
                                                      Text('Analisi in corso...',style: TextStyle(fontSize: 16,color: Colors.black87),)
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
            ),
            Center( 
              child: 
              FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 10) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(117, 238, 72, 108)),
                                onPressed: (){
                                  context.push('/login');
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
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('2186658/SS',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        ),
                                                      SizedBox(
                                                          child: Text('Del',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black54)
                                                                      )
                                                          
                                                        ),
                                                      Expanded( child: Padding(padding:EdgeInsetsGeometry.only(left: 10),
                                                          
                                                        
                                                          child: Text('14/02/2026',
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
                                                        width: 105,
                                                        child: Text('Quesito',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('PATOLOGIE ANIMALI DA AFFEZIONE - CANE',
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
                                                        width: 105,
                                                        child: Text('Attività',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('OFFEDU E PALA S.S.',
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
                                                        width: 105,
                                                        child: Text('Codice Aziendale',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('IT052SS128',
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
                                                        width: 105,
                                                        child: Text('Comune',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('ORUNE',
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
                                                      Icon(Icons.picture_as_pdf,color: Colors.black,),
                                                      Icon(Icons.attach_file,color: Colors.black,)
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
            ),
          ],
          
        ),
    ),
    ),],
        );
        
  }

 


}
