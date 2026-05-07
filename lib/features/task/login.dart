import 'dart:ffi';

import 'package:coran/core/storage/servizio_preferenze.dart';
import 'package:coran/features/task/modello_task.dart';
import 'package:coran/features/task/utente.dart';
import 'package:coran/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

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
final url = Uri.parse('http://192.168.0.167:8080/auth/login');
String? user;
String? password;
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
                      onChanged: (value) => password=value,
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
                            onPressed: ()async{
                        
                                bool risultato= await ConnectivityService.hasInternet();   
                                if(risultato==false){
                                  FocusManager.instance.primaryFocus?.unfocus();
                                                    
                                            
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
                              final risposta = await http.post(
                              url,
                              headers: {
                                'Content-Type': 'application/json',
                              },
                              body: jsonEncode({
                                'user': user,
                                'pws': password,
                              }),
                            );
                              if(risposta.statusCode==200){
                                var token=risposta.body;
                                Map<String, dynamic> payload = Jwt.parseJwt(token);

                                int userId = int.parse(payload['sub']);
                                
                                box.put('utente', userId);
                                box.put('token',risposta.body);
                                box.put('islogged', true);
                                Future<void> importUtente()async{
                                  int? id;
                                  
                                  var box2=Hive.box<Utente>('utente');
                                  var box=Hive.box('login');
                                  id=box.get('utente');

                                  if(box2.get(id)==null&&box.get('islogged')==true){
                                    
                                      var box = Hive.box('login');
                                      if(box.get('token')!=null){}
                                      String token = box.get('token'); // assicurati di salvarlo prima!

                                      var url = Uri.parse('http://192.168.0.167:8080/utente');

                                      var risposta = await http.get(
                                        url,
                                        headers: {
                                          'Authorization': 'Bearer $token',
                                          'Content-Type': 'application/json',
                                        },
                                      );

                                      Map<String, dynamic> data = jsonDecode(risposta.body);
                                      

                                      Utente nuovoUtente=Utente(id: data['id'], nome: data['nominativo'], utenzaRiferimento:data['descrizione'], mail: data['mail'], cellulare: data['cell'], telefono: data['tel'], codiceFiscale: data['codFisc'], password: data['psw'], coordinatore: data['coord']);
                                      
                                      await box2.put(id, nuovoUtente);   
                                    
                                    
                                    
                                  }
                                  
                                }
                                await importUtente();
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
