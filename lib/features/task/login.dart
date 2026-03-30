import 'package:coran/core/storage/servizio_preferenze.dart';
import 'package:coran/features/task/modello_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
import 'test_pdf.dart';


class Login extends ConsumerStatefulWidget {


  const Login({super.key});


  @override
  ConsumerState<Login> createState() => _LoginState();
}
class _LoginState extends ConsumerState<Login> {
String? user;
 bool password_dimenticata=false; 
bool errore=false;
 var box=Hive.box('login');
 
@override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
          Center(
          child:
               SingleChildScrollView(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    
                    Image.asset('assets/images/app_icon.png',width: 80,),
                    Text('Login Coran',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  
                errore==true ? Padding(padding: EdgeInsets.only(top: 12),child: Text('Utente e/o password errati',style: TextStyle(color: Colors.red,fontSize: 16)),) : SizedBox.shrink(),
              
              Padding(padding:EdgeInsetsGeometry.only(left: 30,right: 30,top: 20) ,child: Column(
                  
                  
                  children: [
                    
                    TextField(
                      onChanged:(value) => user=value,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.account_circle_rounded),
                      ),
                    ),
                    Padding(padding:EdgeInsetsGeometry.only(bottom: 20)),
                    if(!password_dimenticata)
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),

                    TextButton(onPressed: (){setState(() {
                      password_dimenticata=!password_dimenticata;
                    }); }, child: Text('Password dimenticata?',style: TextStyle(fontSize: 18),)),

                    if(!password_dimenticata)
                    Padding(
                      padding:EdgeInsetsGeometry.only(left: 30,right: 30),
                      child: SizedBox( 
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                              if(user=='user'){
                                box.put('islogged', true);
                                box.put('utente', 1);
                                context.go('/');
                              }else if(user=='admin'){
                                box.put('islogged', true);
                                box.put('utente', 2);
                                context.go('/');
                              }else{
                                setState(() {
                                  errore=true;
                                });
                              }
                              
                              
                              
                            },
                            child: Text('ACCEDI',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))
                          ),
                        ),
                      ),
                    if(password_dimenticata) ...[
                      Text('Inserire la user e cliccare su Reset Password. Verrà inviata una password temporanea alla mail associata al vostro account',style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
                      Padding(
                      padding:EdgeInsetsGeometry.only(left: 30,right: 30,top: 20),
                      child: SizedBox( 
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){},
                            child: Text('RESET PASSWORD',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))
                          ),
                        ),
                      ),
                    ]
                  ],
                )
                ),
                
              
                    ],
                  ),
                  
                  
                ),
              



              
         
          )
        
    
    );
  }


}
