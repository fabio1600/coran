
import 'package:coran/features/task/accettazioniNotifier.dart';
import 'package:coran/features/task/listaAcc.dart';
import 'package:coran/features/task/utente.dart';
import 'package:coran/features/task/utenteNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'filtriNotifier.dart';


class Paginapreferiti extends ConsumerStatefulWidget {


  const Paginapreferiti({super.key});


  @override
  ConsumerState<Paginapreferiti> createState() => _PaginapreferitiState();
}
class _PaginapreferitiState extends ConsumerState<Paginapreferiti> {

bool eliminaFiltro= false;

@override
  void initState() {
    
    super.initState();
  }
  

 @override
  Widget build(BuildContext context) {
    Utente utente= ref.watch(providerUtente.notifier).getUtente();
    var lista=ref.watch(providerAccettazione).where((a)=>(a.preferito==true)&&(a.Richiedente==utente.nome)).toList();
    
    
    return 
    Column(
          children: [
           
            Expanded(child: ListView( children: [  
              SizedBox(height: 20,), 
              getListaAcc(lista, ref),
              SizedBox(height: 20,)
          ],
          
        
    ),
    ),],
        );
        
  }

 


}
