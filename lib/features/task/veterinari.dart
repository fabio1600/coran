
import 'package:coran/features/task/filtriNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';




class Veterinari extends ConsumerStatefulWidget {


  const Veterinari({super.key});


  @override
  ConsumerState<Veterinari> createState() => _VeterinariState();
}
class _VeterinariState extends ConsumerState<Veterinari> {



  
 
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veterinari'),
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
                    ListTile(
                      leading: Icon(Icons.folder),
                      title: Text('Agenzia AGRIS Sardegna',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder),
                      title: Text('Ambulatori Privati',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder),
                      title: Text('Ara - Regione Sardegna',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder),
                      title: Text('ASL - Regione Sardegna',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder),
                      title: Text('Canili',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder),
                      title: Text('Centro di Referenza Peste',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder),
                      title: Text('Ente Foreste della Sardegna',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder),
                      title: Text('Gruppo Macelli Reg. Sardegna',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('ALTIERI DARIO',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('DISI FABIO',style: TextStyle(fontSize: 18),),
                      onTap: (){
                        ref.watch(providerFiltri.notifier).setVet('DISI FABIO');
                        ref.watch(providerFiltri.notifier).vetController.text="DISI FABIO";
                        context.go('/ricerca');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('SANNA RITA',style: TextStyle(fontSize: 18),),
                      onTap: (){
                        ref.watch(providerFiltri.notifier).setVet('SANNA RITA');
                        ref.watch(providerFiltri.notifier).vetController.text="SANNA RITA";
                        context.go('/ricerca');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('FAEDDA NATHALIE',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('FIDALIS MARCO',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('IDINI FRANCESCO',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('MANAI ROBERTO',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('SANNA KATIUSCIA',style: TextStyle(fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('SOTGIU NICOLA',style: TextStyle(fontSize: 18),),
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