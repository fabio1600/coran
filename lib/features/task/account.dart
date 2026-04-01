
import 'package:coran/features/task/utente.dart';
import 'package:coran/features/task/utenteNotifier.dart';
import 'package:coran/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';




class Account extends ConsumerStatefulWidget {


  const Account({super.key});


  @override
  ConsumerState<Account> createState() => _AccountState();
}
class _AccountState extends ConsumerState<Account> {

  
var box= Hive.box<Utente>('utente');

var box2= Hive.box('login');

 int? id;
 Utente? utente;


 TextEditingController controllerEmail = TextEditingController();
 TextEditingController controllerCellulare = TextEditingController();
 TextEditingController controllerUfficio = TextEditingController();
 TextEditingController controllerCodFisc = TextEditingController();


  
Future<void> checkConn()async{

       
  }
  @override
void initState() {
  
  id=box2.get('utente');
  utente=box.get(id);
  super.initState();
  
  controllerEmail.text = utente!.mail!;
  if(utente!.cellulare!=null){
    controllerCellulare.text=utente!.cellulare!;
  }else{
    controllerCellulare.text='';
  }
  if(utente!.telefono!=null){
    controllerUfficio.text=utente!.telefono!;
  }else{
    controllerUfficio.text='';
  }
  if(utente!.codiceFiscale!=null){
    controllerCodFisc.text=utente!.codiceFiscale!;
  }else{
    controllerCodFisc.text='';
  }

  
} 


String? cellulare;
String? telefono;
String? codiceFiscale;

 
@override
  Widget build(BuildContext context) {

    var ut=ref.watch(providerUtente);

    cellulare=controllerCellulare.text;
    telefono=controllerUfficio.text;
    codiceFiscale=controllerCodFisc.text;



    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
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
                          Text('E-mail',style: TextStyle(fontSize: 20),),
                          TextField(
                            controller: controllerEmail,
                            readOnly: true,
                            
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cellulare',style: TextStyle(fontSize: 20),),
                          TextField(
                            controller: controllerCellulare,
                            onChanged: (value) => cellulare=value,
                            decoration: InputDecoration(
                              
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Telefono Ufficio',style: TextStyle(fontSize: 20),),
                          TextField(
                            controller: controllerUfficio,
                            onChanged: (value) => telefono=value,
                            decoration: InputDecoration(
                              
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Codice Fiscale',style: TextStyle(fontSize: 20),),
                          TextField(
                            controller: controllerCodFisc,
                            onChanged: (value) => codiceFiscale=value,
                            decoration: InputDecoration(
                              
                            ),
                            
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                    child: ElevatedButton(
                      onPressed: () async{
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
                        
                          FocusManager.instance.primaryFocus?.unfocus();
                          ref.watch(providerUtente.notifier).modificaDati(cellulare!, telefono!, codiceFiscale!, utente!);
                          controllerCellulare.text=cellulare!;
                          controllerUfficio.text=telefono!;
                          controllerCodFisc.text=codiceFiscale!;
                        
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blue,
                              content: const Text("Dati aggiornati!",style: TextStyle(fontSize: 16),),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        
                        
                      },
                      child: Text('Aggiorna dati',style: TextStyle(fontSize: 18),)
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