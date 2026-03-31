
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/accettazioniNotifier.dart';
import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/rdpNotifier.dart';
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

    var lista= ref.read(providerRdp).where((a)=>a.idAcc==8878) .toList();
    List<int> ids = lista.map((u) => u.id).toList();
    List<int> l=[];


    var lista2= ref.read(providerRdp).where((a)=>a.idAcc==8523) .toList();
    List<int> ids2 = lista2.map((u) => u.id).toList();
    
    
    Accettazione acc=Accettazione(id: 8878,DataAccettazione: DateTime(2026,03,05),Attivita: 'RUIU RAIMONDO',Indirizzo: 'LOC. SA COA   ::    ESPORLATU (07030)',Richiedente: 'SANNA RITA',Quesito: 'CONTROLLO SCRAPIE SU PICCOLI RUMINANTI REGOLARMENTE MACELLAT',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT028SS028',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',PathAllegati: 'path',Comune: 'ESPORLATU',RapportiDiProva:ids,DataRdp: DateTime(2026,03,08), stato: 'Non letto',positivo: true);
    ref.read(providerAccettazione.notifier).addAccettazione(acc);
    Accettazione acc1=Accettazione(id: 8523,DataAccettazione: DateTime(2026,03,03),Attivita: 'BARAGLIU PIERLUIGI',Indirizzo: 'NUGHEDU SAN NICOLO (07010)',Richiedente: 'SANNA RITA',Quesito: 'RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT044SS121',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',Comune: 'NUGHEDU SAN NICOLO',stato: 'Non letto',RapportiDiProva: ids2);
    ref.read(providerAccettazione.notifier).addAccettazione(acc1);
    Accettazione acc2=Accettazione(id: 8524,DataAccettazione: DateTime(2026,03,01),Attivita: 'AZ. AGR. FARINA S.S.',Indirizzo: 'LOC. SA MELA   ::    ITTIREDDU (07010)',Richiedente: 'SANNA RITA',Quesito: 'RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT032SS043',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',Comune: 'ESPORLATU',stato: 'Analisi in corso',RapportiDiProva: l);
    ref.read(providerAccettazione.notifier).addAccettazione(acc2);
    Accettazione acc3=Accettazione(id: 8525,DataAccettazione: DateTime(2026,03,23),Attivita: 'AZ. AGR. FARINA S.S.',Indirizzo: 'LOC. SA MELA   ::    ITTIREDDU (07010)',Richiedente: 'MANCONI MARIA',Quesito: 'RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT032SS043',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',Comune: 'ESPORLATU',stato: 'Letto',RapportiDiProva: l);
    ref.read(providerAccettazione.notifier).addAccettazione(acc3);
    Accettazione acc4=Accettazione(id: 8526,DataAccettazione: DateTime(2026,03,13),Attivita: 'AZ. AGR. FARINA S.S.',Indirizzo: 'LOC. SA MELA   ::    ITTIREDDU (07010)',Richiedente: 'MANCONI MARIA',Quesito: 'RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',Utente: 'A.S.L. 1 SASSARI',CodiceAzienda: 'IT032SS043',Asl: 'AUSL 1 - SASSARI / OZIERI',Allegati: 'DOCUMENTO DI ACCOMPAGNAMENTO',Comune: 'ESPORLATU',stato: 'Non letto',RapportiDiProva: l);
    ref.read(providerAccettazione.notifier).addAccettazione(acc4);

    Rdp rdp=Rdp(id: 6509, conferimento: '1', tipo: 'MUSCOLO/MUSCOLO SUINO', specie: 'SUINO', campioni: '1', pathPdf: 'pathPdf',positivo: true,data: DateTime(2026,03,05),idAcc: 8878);
    Rdp rdp2=Rdp(id: 6510, conferimento: '2', tipo: 'MUSCOLO/MUSCOLO SUINO', specie: 'SUINO', campioni: '1', pathPdf: 'pathPdf',positivo: false,data: DateTime(2026,03,10),idAcc: 8878);
    Rdp rdp3=Rdp(id: 6511, conferimento: '1', tipo: 'MUSCOLO/MUSCOLO SUINO', specie: 'SUINO', campioni: '1', pathPdf: 'pathPdf',positivo: true,data: DateTime(2026,03,09),idAcc: 8878);
    Rdp rdp4=Rdp(id: 6512, conferimento: '1', tipo: 'MUSCOLO/MUSCOLO SUINO', specie: 'SUINO', campioni: '3', pathPdf: 'pathPdf',positivo: false,data: DateTime(2026,03,05),idAcc: 8878);
    Rdp rdp5=Rdp(id: 6513, conferimento: '2', tipo: 'MUSCOLO/MUSCOLO SUINO', specie: 'SUINO', campioni: '1', pathPdf: 'pathPdf',positivo: true,data: DateTime(2026,03,07),idAcc: 8878);
    ref.watch(providerRdp.notifier).addRdp(rdp);
    ref.watch(providerRdp.notifier).addRdp(rdp2);
    ref.watch(providerRdp.notifier).addRdp(rdp3);
    ref.watch(providerRdp.notifier).addRdp(rdp4);
    ref.watch(providerRdp.notifier).addRdp(rdp5);

    Rdp rdp6=Rdp(id: 6520, conferimento: '1', tipo: 'MUSCOLO/MUSCOLO SUINO', specie: 'SUINO', campioni: '1', pathPdf: 'pathPdf',positivo: true,data: DateTime(2026,03,01),idAcc: 8523);
    Rdp rdp7=Rdp(id: 6521, conferimento: '2', tipo: 'MUSCOLO/MUSCOLO SUINO', specie: 'SUINO', campioni: '1', pathPdf: 'pathPdf',positivo: false,data: DateTime(2026,03,15),idAcc: 8523);
    Rdp rdp8=Rdp(id: 6522, conferimento: '1', tipo: 'MUSCOLO/MUSCOLO SUINO', specie: 'SUINO', campioni: '1', pathPdf: 'pathPdf',positivo: true,data: DateTime(2026,03,09),idAcc: 8523);
    Rdp rdp9=Rdp(id: 6523, conferimento: '1', tipo: 'MUSCOLO/MUSCOLO SUINO', specie: 'SUINO', campioni: '3', pathPdf: 'pathPdf',positivo: false,data: DateTime(2026,03,05),idAcc: 8523);
    Rdp rdp10=Rdp(id: 6524, conferimento: '2', tipo: 'MUSCOLO/MUSCOLO SUINO', specie: 'SUINO', campioni: '1', pathPdf: 'pathPdf',positivo: true,data: DateTime(2026,03,03),idAcc: 8523);
    ref.watch(providerRdp.notifier).addRdp(rdp6);
    if(rdp6.positivo==true){

      ref.watch(providerAccettazione.notifier).setPositivo(ref.watch(providerAccettazione).firstWhere((a)=>a.id==rdp6.idAcc));

    }
    ref.watch(providerRdp.notifier).addRdp(rdp7);
    ref.watch(providerRdp.notifier).addRdp(rdp8);
    ref.watch(providerRdp.notifier).addRdp(rdp9);
    ref.watch(providerRdp.notifier).addRdp(rdp10);

    

    Utente utente=Utente(id: 1, nome: 'SANNA RITA', utenzaRiferimento: 'ASL 1 SASSARI - B',distretto: 'DISTRETTO DI SASSARI', mail: 'fabio.disi@izs-sardegna.ittttt', cellulare: '3400551142', telefono: '07892274', codiceFiscale: 'DSIFBA00T07I452E', password: 'password',coordinatore: true);
    ref.watch(providerUtente.notifier).addUtente(utente);

    Utente utente2=Utente(id: 2, nome: 'MANCONI MARIA', utenzaRiferimento: 'ASL 1 Sassari - A',distretto: 'DISTRETTO DEL GOCEANO', mail: 'fabio.disi@izs-sardegna.it', cellulare: '340000000', telefono: '07840047', codiceFiscale: 'IDBCWICBWDUICB', password: 'password2',coordinatore: false);
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