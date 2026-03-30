
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/rdpNotifier.dart';
import 'package:coran/features/task/utente.dart';
import 'package:coran/features/task/utenteNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'filtriNotifier.dart';
import 'accettazioniNotifier.dart';
import 'package:intl/intl.dart';


class Ricerca extends ConsumerStatefulWidget {


  const Ricerca({super.key});


  @override
  ConsumerState<Ricerca> createState() => _RicercaState();
}
class _RicercaState extends ConsumerState<Ricerca> {

bool eliminaFiltro= false;

@override
  void initState() {
    
    super.initState();
  }

bool rispettaFiltri(Accettazione acc,String? rich,String? cod,String? rag,String? que,String? verb,DateTime? accDal,DateTime? accAl,DateTime? rdpDal,DateTime? rdpAl,String? stato,String? vet,bool? positivo){
  final rapportiDiProva=ref.watch(providerRdp).where((a)=>acc.RapportiDiProva!.contains(a.id));
  if(rich!=null&&acc.id!=int.parse(rich))return false;
  if(cod!=null&&acc.CodiceAzienda!=cod)return false;
  if(rag!=null&&acc.Attivita.contains(rag))return false;
  if(que!=null&&(!acc.Quesito.contains(que)))return false;
  /*if(verb!=null&&acc.Richiedente!=rich)return false;*/
  if(accDal!=null&&acc.DataAccettazione.isBefore(accDal))return false;
  if(accAl!=null&&acc.DataAccettazione.isAfter(accAl))return false;
  if(rdpDal!=null&&(rapportiDiProva.isNotEmpty&&(!rapportiDiProva.any((a)=>a.data!.isAfter(rdpDal)))||(rapportiDiProva.isEmpty)))return false;
  if(rdpAl!=null&&(rapportiDiProva.isNotEmpty&&(!rapportiDiProva.any((a)=>a.data!.isBefore(rdpAl)))||(rapportiDiProva.isEmpty)))return false;
  if(stato!=null&&acc.stato!=stato)return false;
  if(positivo==true&&acc.positivo==false) return false;       
  if(vet!=null&&acc.Richiedente!=vet)return false;
  return true;
}

void ordinaPer(List<Accettazione> lista,String? ordine){
  if(ordine=='Data accettazione crescente'){lista.sort((a,b)=>a.DataAccettazione.compareTo(b.DataAccettazione));}
  if(ordine=='Data accettazione decrescente'||ordine==null){lista.sort((a,b)=>b.DataAccettazione.compareTo(a.DataAccettazione));}
  if(ordine=='Data rapporto di prova crescente'){
    lista.sort((a, b) {
      if (a.DataRdp == null && b.DataRdp == null) return 0;
      if (a.DataRdp == null) return 1;
      if (b.DataRdp == null) return -1;

      return a.DataRdp!.compareTo(b.DataRdp!);
    });
  }
  if(ordine=='Data rapporto di prova decrescente'){
    lista.sort((a, b) {
      if (a.DataRdp == null && b.DataRdp == null) return 0;
      if (a.DataRdp == null) return 1;
      if (b.DataRdp == null) return -1;

      return b.DataRdp!.compareTo(a.DataRdp!);
    });
  }
}



 @override
  Widget build(BuildContext context) {
    Utente utente=ref.watch(providerUtente.notifier).getUtente();
    final listaOrginale=ref.watch(providerAccettazione).where((acc)=>acc.Richiedente==utente.nome);
    final filtri=ref.watch(providerFiltri);
    final listaFiltrata =listaOrginale.where((item) =>
  rispettaFiltri(item, filtri.richiesta, filtri.codiceAziendale, filtri.ragioneSociale,
                filtri.quesito, filtri.verbale, filtri.accDal, filtri.accAl,
                filtri.rdpDal, filtri.rdpAl,filtri.stato,filtri.veterinario,filtri.positivo)
).toList();

ordinaPer(listaFiltrata, filtri.ordine);
    bool test=true;
final rdp=ref.watch(providerRdp);
  final acc=ref.watch(providerAccettazione);
  
    return 
    
    Column(
          children: [
           
            Expanded(child: ListView( children: [
              SingleChildScrollView(
                padding: EdgeInsets.all( 10),
                scrollDirection: Axis.horizontal,
                child: Row (spacing: 5, children: [
                if(filtri.veterinario!=null)
                
                Chip(
                  label: Text("${filtri.veterinario}"),
                  onDeleted: () {
                    ref.read(providerFiltri.notifier).clearVet();
                    
                  },
                ),
                if(filtri.stato!=null)
                Chip(
                  label: Text("${filtri.stato}"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearStato();
                  },
                ),
                if(filtri.positivo==true)
                Chip(
                  label: Text("Positivo"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearStato();
                  },
                ),
                if(filtri.richiesta!=null)
                Chip(
                  label: Text("${filtri.richiesta}"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearRich();
                  },
                ),
                if(filtri.codiceAziendale!=null)
                Chip(
                  label: Text("${filtri.codiceAziendale}"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearCod();
                  },
                ),
                if(filtri.ragioneSociale!=null)
                Chip(
                  label: Text("${filtri.ragioneSociale}"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearRag();
                  },
                ),
                if(filtri.quesito!=null)
                Chip(
                  label: Text("${filtri.quesito}"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearQue();
                  },
                ),
                if(filtri.verbale!=null)
                Chip(
                  label: Text("${filtri.verbale}"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearVerb();
                  },
                ),
                if(filtri.accDal!=null)
                Chip(
                  label: Text("Acc dal ${filtri.accDal!.day}/${filtri.accDal!.month}/${filtri.accDal!.year}"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearAccDal();
                   
                  },
                ),
                if(filtri.accAl!=null)
                Chip(
                  label: Text("Acc al ${filtri.accAl!.day}/${filtri.accAl!.month}/${filtri.accAl!.year}"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearAccAl();
                  },
                ),
                if(filtri.rdpDal!=null)
                Chip(
                  label: Text("Rdp dal ${filtri.rdpDal!.day}/${filtri.rdpDal!.month}/${filtri.rdpDal!.year}"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearRdpDal();
                  },
                ),
                if(filtri.rdpAl!=null)
                Chip(
                  label: Text("Rdp al ${filtri.rdpAl!.day}/${filtri.rdpAl!.month}/${filtri.rdpAl!.year}"),
                  onDeleted: () {
                    ref.watch(providerFiltri.notifier).clearRdpAl();
                  },
                ),
                ])),
                ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listaFiltrata.length,
              itemBuilder:(context, index) {
              final item = listaFiltrata[index];
              final positivi=ref.watch(providerRdp.notifier).getPositivi(item.RapportiDiProva!);
              
              return Center( 
              
              child: 
              FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 5) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                 style:(positivi ==true&&item.stato=='Non letto') ? ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(117, 238, 72, 108)): (positivi ==false&&item.stato=='Non letto')?  ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 80, 200, 255))  : ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 197, 207, 213)),
                                onPressed: (){
                                  context.push('/accettazione/${item.id}');
                                },
                                onLongPress: (){
                                  ref.read(providerFiltri.notifier).setPreferito();
                                },
                                child: Column(
                                  children: [ 
                                        
                                        Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10),
                                            child: Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Richiesta',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${item.id}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        ),
                                                      Row (
                                                          mainAxisSize: MainAxisSize.min,
                                                          children:[
                                                            Icon(ref.watch(providerFiltri).icona,color: Colors.black,)
                                                          ]
                                                        )
                                                      ]
                                                    )
                                          )
                                        ),
                                      Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10),
                                            child: Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Data Accettazione',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${DateFormat('dd/MM/yyyy').format(item.DataAccettazione)}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                          )
                                        ),
                                    
                                    Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10),
                                            child: Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Quesito',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${item.Quesito}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                          )
                                        ),
                                    Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10),
                                            child: Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Attività',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${item.Attivita}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                          )
                                        ),
                                    Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10,bottom: 10),
                                            child:Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Codice Aziendale',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${item.CodiceAzienda}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                              
                                            )
                                          ),
                                          Align(
                                          alignment: AlignmentGeometry.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(left: 0,top: 10,bottom: 10),
                                            child:Row (
                                                    children:[
                                                      SizedBox(
                                                        width: 120,
                                                        child: Text('Comune',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('${item.Comune}',
                                                                      style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)
                                                                      )
                                                                    )
                                                        )
                                                      ]
                                                    )
                                              
                                            )
                                          ),
                                          Align(
                                          alignment: AlignmentGeometry.centerRight,
                                          child: Padding(
                                            padding: EdgeInsetsGeometry.only(top: 0,bottom: 5),
                                            child:  Row (
                                              mainAxisSize: MainAxisSize.min,
                                                    children:[
                                                      positivi==true ? Icon(Icons.error_outline,color: Colors.black,) : SizedBox.shrink(),
                                                      item.RapportiDiProva !=null ? Icon(Icons.picture_as_pdf,color: Colors.black,) : Text('Analisi in corso...',style: TextStyle(color: Colors.black87,fontSize: 16),),
                                                      item.Allegati!=null ? Icon(Icons.attach_file,color: Colors.black,) : SizedBox.shrink()
                                                      ],
                                                    ),
                                          
                                          )
                                        ),
                                          
                                  ],
                                ),
                                ),
                            ),
                          ),
                        ),
            );
              
              }
            ),
            SizedBox(height: 20,)
              ],
            ),
              ),
               
            
          ],
          
        );
    
   
        
  }

 


}
