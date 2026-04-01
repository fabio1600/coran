
import 'package:coran/features/task/utente.dart';
import 'package:coran/features/task/utenteNotifier.dart';
import 'package:coran/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class Cambiopassword extends ConsumerStatefulWidget {


  const Cambiopassword({super.key});


  @override
  ConsumerState<Cambiopassword> createState() => _CambiopasswordState();
}
class _CambiopasswordState extends ConsumerState<Cambiopassword> {

bool? conn;
Future<void> checkConn()async{
     conn= await ConnectivityService.hasInternet();   
}
 
String? errore;
    String? errore2;

 
@override
  Widget build(BuildContext context) {
    Utente utente=ref.watch(providerUtente.notifier).getUtente();
    String? passwordAttuale;
    String? nuovaPassword;
    String? nuovaPassword2;
    bool check=false;
    
    TextEditingController controller1=TextEditingController();
    controller1.text="";

    TextEditingController controller2=TextEditingController();
    controller2.text="";

    TextEditingController controller3=TextEditingController();

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambio Password'),
        centerTitle: true,

      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Password Attuale',style: TextStyle(fontSize: 20),),
                          TextField(
                            controller: controller3,
                            obscureText: true,
                            decoration: InputDecoration(
                              
                              errorText: errore2
                            ),
                            onChanged: (value) => passwordAttuale=value,
                            
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nuova Password',style: TextStyle(fontSize: 20),),
                          TextField(
                            controller: controller1,
                            obscureText: true,
                            onChanged: (value) => (nuovaPassword=value)
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ripeti Password',style: TextStyle(fontSize: 20),),
                          TextField(
                          controller: controller2,
                          obscureText: true,
                          decoration: InputDecoration(
                            
                            errorText: errore,
                          ),
                          onChanged: (value)=> nuovaPassword2=value
                          )
                        ],
                      ),
                    ),
                    
                    SizedBox(
                      height: 50,
                      width: 200,
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
                        
                        setState(() {
                          if(passwordAttuale==utente.password){
                          if(nuovaPassword2==nuovaPassword&&(controller2.text!=""&&controller1.text!="")){
                            ref.watch(providerUtente.notifier).modificaPassword(nuovaPassword!, utente);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.blue,
                                content: const Text("Password aggiornata!",style: TextStyle(fontSize: 16),),
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                            errore=null;
                            
                          }
                          else if(controller2.text==""||controller1.text==""){
                            errore="Inserire valore!";
                          }
                          else{
                            
                            errore="Le password non coincidono";
                            errore2=null;
                          }
                          errore2=null;
                        }else{
                          
                            errore2="Password errata";
                            errore=null;
                          
                          
                        }
                        
                        });
                        
                      },
                      child: Text('Aggiorna password',style: TextStyle(fontSize: 18),)
                      )
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
    


  }
}