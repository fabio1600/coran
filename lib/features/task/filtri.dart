import 'package:coran/core/storage/servizio_preferenze.dart';
import 'package:coran/features/task/modello_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'provider_task.dart';
import 'package:coran/core/storage/servizio_preferenze.dart';
import 'scaffoldBase.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Filtri extends ConsumerStatefulWidget {


  const Filtri({super.key});


  @override
  ConsumerState<Filtri> createState() => _FiltriState();
}
class _FiltriState extends ConsumerState<Filtri> {

DateTime? accDal;
DateTime? accAl;
  TextEditingController accDalController = TextEditingController();
  TextEditingController accAlController = TextEditingController();
DateTime? rdpDal;
DateTime? rdpAl;
  TextEditingController rdpDalController = TextEditingController();
  TextEditingController rdpAlController = TextEditingController();

  Future<void> _pickDate(
    DateTime? currentData,
    void Function(DateTime) onPicked, // callback per aggiornare la variabile
) async {
  final DateTime? picked = await showDatePicker(
    locale: const Locale('it'),
    context: context,
    initialDate: currentData ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (picked != null) {
    setState(() {
      onPicked(picked); // aggiorna la variabile nel State
    });
  }
}



 @override
  Widget build(BuildContext context) {
    bool test=true;

    return Scaffold(
          appBar:  AppBar(
        title: Text('Filtri',textAlign: TextAlign.left,)
        
        
      ),
          body:Column(
            
          children: [
            Expanded(child: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            
               FractionallySizedBox(
                  widthFactor: 0.95,
                  child:Column(
                    children: [
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 10,top: 16),child: 
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text('Seleziona veterinario',style: TextStyle(fontSize: 20),),
                              trailing: Icon(Icons.chevron_right),
                              onTap: (){
                                context.push('/veterinari');
                              },
                            )),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 30),
                              child: Text('Richiesta',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                             
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                
                                      decoration: InputDecoration(
                                        
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      
                      
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Codice Aziendale',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                
                                      decoration: InputDecoration(
                                        
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                            )
                          ],
                        ),
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Ragione Sociale',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                
                                      decoration: InputDecoration(
                                        
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                            )
                          ],
                        ),
                     Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Quesito',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                
                                      decoration: InputDecoration(
                                        
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Verbale',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                
                                      decoration: InputDecoration(
                                        focusColor: Colors.blue,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Accettazioni dal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: accDalController,
                                      readOnly: true,
                                      onTap: () {
                                                _pickDate(accDal, (picked) {
                                                  accDal = picked;
                                                  accDalController.text =
                                                      "${picked.day}/${picked.month}/${picked.year}";
                                                });
                                              },
                                      decoration: InputDecoration(  
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                    ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Accettazioni al',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: accAlController,
                                      readOnly: true,
                                      onTap: () {
                                                _pickDate(accAl, (picked) {
                                                  accAl = picked;
                                                  accAlController.text =
                                                      "${picked.day}/${picked.month}/${picked.year}";
                                                });
                                              },
                                
                                      decoration: InputDecoration(  
                                        
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                    ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Rapporti di prova dal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: rdpDalController,
                                      readOnly: true,
                                      onTap: () {
                                                _pickDate(rdpDal, (picked) {
                                                  accAl = picked;
                                                  rdpDalController.text =
                                                      "${picked.day}/${picked.month}/${picked.year}";
                                                });
                                              },
                                
                                      decoration: InputDecoration(  
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                    ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Rapporti di prova al',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: rdpAlController,
                                      readOnly: true,
                                      onTap: () {
                                                _pickDate(rdpAl, (picked) {
                                                  accAl = picked;
                                                  rdpAlController.text =
                                                      "${picked.day}/${picked.month}/${picked.year}";
                                                });
                                              },
                                
                                      decoration: InputDecoration(  
                                        
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                    ),
                            )
                          ],
                        ),
                        Center(
                          widthFactor: 0.95,
                          
                          child: Container(
                            
                            height: 95,
                            width: double.infinity,
                            padding:EdgeInsetsGeometry.only(top: 20,bottom: 30,left: 30,right: 10),
                            child: ElevatedButton(
                              
                              onPressed: (){},
                              child: Text('Applica Filtri',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                              ),
                            ),
                        )
                      
                     
                    ],
                  )
                ),
              
            
            
          ],
          
        ),
    ),
    ),],
        ),
    );
  }

 


}
