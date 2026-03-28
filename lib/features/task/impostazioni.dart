
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/accettazioniNotifier.dart';
import 'package:coran/features/task/utente.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'utenteNotifier.dart';



class Impostazioni extends ConsumerStatefulWidget {


  const Impostazioni({super.key});


  @override
  ConsumerState<Impostazioni> createState() => _ImpostazioniState();
}

class _ImpostazioniState extends ConsumerState<Impostazioni> {
  var box=Hive.box('login');
  void aggiungi(){
    List<int> l=[1,2];
    Accettazione acc=Accettazione(id: 8878,DataAccettazione: DateTime(2026,03,05),Attivita: 'RUIU RAIMONDO',Indirizzo: 'LOC. SA COA   ::    ESPORLATU (07030)',Richiedente: 'SANNA RITA',Quesito: 'CONTROLLO SCRAPIE SU PICCOLI RUMINANTI REGOLARMENTE MACELLAT',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT028SS028',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',PathAllegati: 'path',Comune: 'ESPORLATU',RapportiDiProva:l,DataRdp: DateTime(2026,03,08), stato: 'Positivo');
    ref.read(providerAccettazione.notifier).addAccettazione(acc);
    Accettazione acc1=Accettazione(id: 8523,DataAccettazione: DateTime(2026,03,03),Attivita: 'BARAGLIU PIERLUIGI',Indirizzo: 'NUGHEDU SAN NICOLO (07010)',Richiedente: 'SANNA RITA',Quesito: 'RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT044SS121',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',Comune: 'NUGHEDU SAN NICOLO',stato: 'Non letto');
    ref.read(providerAccettazione.notifier).addAccettazione(acc1);
    Accettazione acc2=Accettazione(id: 8524,DataAccettazione: DateTime(2026,03,03),Attivita: 'AZ. AGR. FARINA S.S.',Indirizzo: 'LOC. SA MELA   ::    ITTIREDDU (07010)',Richiedente: 'SANNA RITA',Quesito: 'RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT032SS043',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',Comune: 'ESPORLATU',stato: 'Letto');
    ref.read(providerAccettazione.notifier).addAccettazione(acc2);

    Utente utente=Utente(id: 1, nome: 'SANNA RITA', utenzaRiferimento: 'ASL 1 SASSARI - B',distretto: 'DISTRETTO DI SASSARI', mail: 'fabio.disi@izs-sardegna.ittttt', cellulare: '3400551142', telefono: '07892274', codiceFiscale: 'DSIFBA00T07I452E', password: 'password');
    ref.watch(providerUtente.notifier).addUtente(utente);

    Utente utente2=Utente(id: 2, nome: ' MANCONI MARIA', utenzaRiferimento: 'ASL 1 Sassari - A',distretto: 'DISTRETTO DEL GOCEANO', mail: 'fabio.disi@izs-sardegna.it', cellulare: '340000000', telefono: '07840047', codiceFiscale: 'IDBCWICBWDUICB', password: 'password2');
    ref.watch(providerUtente.notifier).addUtente(utente2);
  }
 
@override
  Widget build(BuildContext context) {
    var box= Hive.box('login');
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
                    onPressed: () {
                      box.put('islogged',false);
                      context.go('/login');
                    },
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