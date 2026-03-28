
import 'package:coran/features/task/utente.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
void initState() {
  id=box2.get('utente');
  utente=box.get(id);
  super.initState();
  controllerEmail.text = utente!.mail!;
  controllerCellulare.text=utente!.cellulare!;
  controllerUfficio.text=utente!.telefono!;
  controllerCodFisc.text=utente!.codiceFiscale!;
} 
 
@override
  Widget build(BuildContext context) {
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
                          Text('Cellulare',style: TextStyle(fontSize: 20),),
                          TextField(
                            controller: controllerCellulare,
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
                      onPressed: (){},
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