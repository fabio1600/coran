
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/accettazioniNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';




class Impostazioni extends ConsumerStatefulWidget {


  const Impostazioni({super.key});


  @override
  ConsumerState<Impostazioni> createState() => _ImpostazioniState();
}
class _ImpostazioniState extends ConsumerState<Impostazioni> {
  void aggiungi(){
    List<int> l=[1,2];
    Accettazione acc=Accettazione(id: 8878,DataAccettazione: DateTime(2026,03,05),Attivita: 'RUIU RAIMONDO',Indirizzo: 'LOC. SA COA   ::    ESPORLATU (07030)',Richiedente: 'SANNA RITA',Quesito: 'CONTROLLO SCRAPIE SU PICCOLI RUMINANTI REGOLARMENTE MACELLAT',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT028SS028',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',PathAllegati: 'path',Comune: 'ESPORLATU',RapportiDiProva:l,stato: 'Positivo');
    ref.read(providerAccettazione.notifier).addAccettazione(acc);
    Accettazione acc1=Accettazione(id: 8523,DataAccettazione: DateTime(2026,03,03),Attivita: 'BARAGLIU PIERLUIGI',Indirizzo: 'NUGHEDU SAN NICOLO (07010)',Richiedente: 'SANNA RITA',Quesito: 'RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT044SS121',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',Comune: 'NUGHEDU SAN NICOLO',stato: 'Non letto');
    ref.read(providerAccettazione.notifier).addAccettazione(acc1);
    Accettazione acc2=Accettazione(id: 8524,DataAccettazione: DateTime(2026,03,03),Attivita: 'AZ. AGR. FARINA S.S.',Indirizzo: 'LOC. SA MELA   ::    ITTIREDDU (07010)',Richiedente: 'SANNA RITA',Quesito: 'RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT032SS043',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',Comune: 'ESPORLATU',stato: 'Letto');
    ref.read(providerAccettazione.notifier).addAccettazione(acc2);
  }
 
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              
              padding: EdgeInsets.all(25),
              child:Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Account',style: TextStyle(fontSize: 20),),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      context.push('/account');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.key),
                    title: Text('Cambio Password',style: TextStyle(fontSize: 20),),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      context.push('/password');  
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications_active),
                    title: Text('Segnalazione',style: TextStyle(fontSize: 20),),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      context.push('/segnalazione');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Privacy',style: TextStyle(fontSize: 20),),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  
                  SizedBox(height: 200),
                  ElevatedButton(onPressed:(){aggiungi();} , child: Text('aggiungi')),
                  Text(
                    'Versione 1.0.0',
                    style: TextStyle(color: Colors.grey),
                  ),

                  SizedBox(height: 10),

                  TextButton(
                    onPressed: () {},
                    child: Text('Logout',style: TextStyle(fontSize: 20),),
                  )
                ],
              ),
            ),
          )
        ),
      ],
    );


  }
}