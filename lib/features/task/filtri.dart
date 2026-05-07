
import 'package:coran/features/task/accettazioniNotifier.dart';
import 'package:coran/features/task/utente.dart';
import 'package:coran/features/task/utenteNotifier.dart';
import 'package:coran/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'filtriNotifier.dart';

class Filtri extends ConsumerStatefulWidget {


  const Filtri({super.key});


  @override
  ConsumerState<Filtri> createState() => _FiltriState();
}
class _FiltriState extends ConsumerState<Filtri> {

  

DateTime? accDal;
DateTime? accAl;
  

DateTime? rdpDal;
DateTime? rdpAl;


String ordine='Data accettazione decrescente';
String? stato;
  

  Future<void> _pickDate(
    DateTime? currentData,
    void Function(DateTime) onPicked, // callback per aggiornare la variabile
) async {
  final DateTime? picked = await showDatePicker(
    locale: const Locale('it'),
    context: context,
    initialDate: currentData ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (picked != null) {
    setState(() {
      onPicked(picked); // aggiorna la variabile nel State
    });
  }
}

String? quesSel;

@override
void initState() {
  super.initState();
  final filtri = ref.read(providerFiltri);
  if(filtri.accAl==null)                  // inizializza la variabile locale
  ref.read(providerFiltri.notifier).accAlController.text="";
  if(filtri.accDal==null)
  ref.read(providerFiltri.notifier).accDalController.text="";
  if(filtri.veterinario==null)                  // inizializza la variabile locale
  ref.read(providerFiltri.notifier).vetController.text="";
  if(filtri.richiesta==null)                  // inizializza la variabile locale
  ref.read(providerFiltri.notifier).richController.text="";
  if(filtri.codiceAziendale==null)                  // inizializza la variabile locale
  ref.read(providerFiltri.notifier).codController.text="";
  if(filtri.ragioneSociale==null)                  // inizializza la variabile locale
  ref.read(providerFiltri.notifier).ragController.text="";
  
  if(filtri.quesito!=null){
    quesSel=filtri.quesito!;
  }

  if(filtri.verbale==null)                  // inizializza la variabile locale
  ref.read(providerFiltri.notifier).verbController.text="";
  if(filtri.rdpDal==null)                  // inizializza la variabile locale
  ref.read(providerFiltri.notifier).rdpDalController.text="";
  if(filtri.rdpAl==null)                  // inizializza la variabile locale
  ref.read(providerFiltri.notifier).rdpAlController.text="";
  if(filtri.ordine!=null){
    ordine=filtri.ordine!;
  }
  if(filtri.stato!=null){
    stato=filtri.stato;
  }
}
  

 @override
  Widget build(BuildContext context) {

    Utente utente=ref.watch(providerUtente.notifier).getUtente();

    List<String> ordinamenti=['Data accettazione decrescente','Data accettazione crescente','Data rapporto di prova crescente','Data rapporto di prova decrescente'];
    void ordina(String ordine){
      {ordinamenti.remove(ordine);ordinamenti.insert(0, ordine);}
    }
    if(ref.watch(providerFiltri).ordine!=null){
      ordina(ref.watch(providerFiltri).ordine!);
    }
    

    List<String> stati=['Non letto','Letto','Positivo','Analisi in corso'];
    
    
    return Scaffold(
          appBar:  AppBar(
        title: Text('Filtri',textAlign: TextAlign.left,)
        
        
      ),
          body:Column(
            
          children: [
            Expanded(child: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            
               FractionallySizedBox(
                  widthFactor: 0.95,
                  child:Column(
                    children: [
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(utente.coordinatore==true)
                              Padding(padding: EdgeInsets.only(left: 10,top: 16),child: 
                              ListTile(
                              leading: Icon(Icons.person),
                              title: Text('Seleziona veterinario',style: TextStyle(fontSize: 20),),
                              trailing: Icon(Icons.chevron_right),
                              onTap: ()async{
                        
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
                                context.push('/veterinari');
                              },
                            )),
                            
                            
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Ordina per',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            
                                SizedBox(
                                  height: 60,
                                  child: ListView.builder(
                                  padding: EdgeInsets.only(left: 30,top: 10),
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: ordinamenti.length,
                                  itemBuilder:(context, index) {
                                    final item=ordinamenti[index];
                                    return Padding(
                                      padding:EdgeInsets.only(right: 10), 
                                      child: ElevatedButton(
                                    
                                        style: ElevatedButton.styleFrom(
                                          
                                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                                          
                                          side: BorderSide(
                                            color: const Color.fromARGB(255, 71, 71, 71), // 👈 colore bordo
                                            width: ordine==item
                                                ? 2
                                                : 0.9,          
                                          ),
                                        ),
                                      onPressed: (){
                                        
                                        setState(() {
                                          ordine=item;
                                        });
                                      }, 
                                      child: Text(item,style: ordine==item ? TextStyle(color: Colors.black,fontWeight: FontWeight.bold) : TextStyle(color: Colors.black))
                                    )
                                  );
                                    
                                  }
                                ),
                                ),

                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 30),
                              child: Text('Seleziona stato',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            
                                SizedBox(
                                  height: 60,
                                  child: ListView.builder(
                                  padding: EdgeInsets.only(left: 30,top: 10),
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: stati.length,
                                  itemBuilder:(context, index) {
                                    final item=stati[index];
                                    return Padding(
                                      padding:EdgeInsets.only(right: 10), 
                                      child: ElevatedButton(
                                    
                                        style: ElevatedButton.styleFrom(
                                          
                                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                                          
                                          side: BorderSide(
                                            color: const Color.fromARGB(255, 71, 71, 71), // 👈 colore bordo
                                            width: stato==item
                                                ? 2
                                                : 0.9,          
                                          ),
                                        ),
                                      onPressed: (){
                                        
                                        setState(() {
                                          stato=item;
                                        });
                                      }, 
                                      child: Text(item,style: stato==item ? TextStyle(color: Colors.black,fontWeight: FontWeight.bold) : TextStyle(color: Colors.black))
                                    )
                                  );
                                    
                                  }
                                ),
                                ), 

                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 30),
                              child: Text('Richiesta',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                             
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: ref.read(providerFiltri.notifier).richController,
                                      onChanged: (value) => ref.watch(providerFiltri.notifier).richController.text=value,
                                      decoration: InputDecoration(
                                        
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      
                      
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Codice Aziendale',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: ref.watch(providerFiltri.notifier).codController,
                                      onChanged: (value) => ref.watch(providerFiltri.notifier).codController.text=value,
                                      decoration: InputDecoration(
                                        
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                            )
                          ],
                        ),
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Ragione Sociale',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: ref.watch(providerFiltri.notifier).ragController,
                                      onChanged: (value) => ref.watch(providerFiltri.notifier).ragController.text=value,
                                      decoration: InputDecoration(
                                        
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                            )
                          ],
                        ),
                     Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Quesito',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child:
                            DropdownButton<String>(
                            underline: SizedBox(),
                            isExpanded: true,
                            value: quesSel,
                            hint:  const Text("Seleziona"),
                            items: ref.watch(providerAccettazione.notifier).getQuesiti(ref.watch(providerUtente.notifier).getUtente().id).map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                quesSel=value;
                                ref.watch(providerFiltri.notifier).setQue(value!);
                              });
                            },
                          ),
                            )
                          ],
                        ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Verbale',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: ref.watch(providerFiltri.notifier).verbController,
                                      onChanged: (value) => ref.watch(providerFiltri.notifier).verbController.text=value,
                                      decoration: InputDecoration(
                                        focusColor: Colors.blue,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Accettazioni dal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: ref.watch(providerFiltri.notifier).accDalController,
                                      readOnly: true,
                                      onTap: () {
                                                _pickDate(accDal, (picked) {
                                                  accDal = picked;
                                                  ref.read(providerFiltri.notifier).accDalController.text =
                                                      "${picked.day}/${picked.month}/${picked.year}";
                                                  
                                                });
                                              },
                                     
                                      decoration: InputDecoration(  
                                        border: OutlineInputBorder(),
                                        suffixIcon: ref.read(providerFiltri.notifier).accDalController.text.isEmpty
                                        ? Icon(Icons.calendar_today)
                                        : IconButton(
                                            icon: Icon(Icons.clear),
                                            onPressed: () {
                                              accDal = null;
                                              ref.watch(providerFiltri.notifier).accDalController.clear();

                                              

                                              setState(() {});
                                            },
                                          ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Accettazioni al',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: ref.watch(providerFiltri.notifier).accAlController,
                                      readOnly: true,
                                      onTap: () {
                                                _pickDate(accAl, (picked) {
                                                  accAl = picked;
                                                  ref.read(providerFiltri.notifier).accAlController.text =
                                                      "${picked.day}/${picked.month}/${picked.year}";
                                                  
                                                });
                                              },
                                
                                      decoration: InputDecoration(  
                                        
                                      border: OutlineInputBorder(),
                                        suffixIcon:  ref.read(providerFiltri.notifier).accAlController.text.isEmpty
                                        ? Icon(Icons.calendar_today)
                                        :  IconButton(
                                            icon: Icon(Icons.clear),
                                            onPressed: () {
                                              accAl = null;
                                              ref.watch(providerFiltri.notifier).accAlController.clear();

                                              

                                              setState(() {});
                                            },
                                          )
                                      ),
                                    ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Rapporti di prova dal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: ref.watch(providerFiltri.notifier).rdpDalController,
                                      readOnly: true,
                                      onTap: () {
                                                _pickDate(rdpDal, (picked) {
                                                 rdpDal = picked;
                                                  ref.watch(providerFiltri.notifier).rdpDalController.text =
                                                      "${picked.day}/${picked.month}/${picked.year}";
                                                });
                                              },
                                
                                      decoration: InputDecoration(  
                                      border: OutlineInputBorder(),
                                      suffixIcon:  ref.read(providerFiltri.notifier).rdpDalController.text.isEmpty
                                        ? Icon(Icons.calendar_today)
                                        :  IconButton(
                                            icon: Icon(Icons.clear),
                                            onPressed: () {
                                              rdpDal = null;
                                              ref.watch(providerFiltri.notifier).rdpDalController.clear();

                                              

                                              setState(() {});
                                            },
                                          )
                                      ),
                                    ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Text('Rapporti di prova al',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              
                              alignment: Alignment.centerLeft,
                              
                              height: 60,
                              padding: EdgeInsets.only(left: 30,top: 10,right: 10),
                              child: TextField(
                                      controller: ref.watch(providerFiltri.notifier).rdpAlController,
                                      readOnly: true,
                                      onTap: () {
                                                _pickDate(rdpAl, (picked) {
                                                  rdpAl = picked;
                                                  ref.watch(providerFiltri.notifier).rdpAlController.text =
                                                      "${picked.day}/${picked.month}/${picked.year}";
                                                });
                                              },
                                
                                      decoration: InputDecoration(  
                                        
                                      border: OutlineInputBorder(),
                                      suffixIcon:  ref.read(providerFiltri.notifier).rdpAlController.text.isEmpty
                                        ? Icon(Icons.calendar_today)
                                        :  IconButton(
                                            icon: Icon(Icons.clear),
                                            onPressed: () {
                                              rdpAl = null;
                                              ref.watch(providerFiltri.notifier).rdpAlController.clear();

                                              

                                              setState(() {});
                                            },
                                          )
                                      ),
                                    ),
                            )
                          ],
                        ),
                        Center(
                          widthFactor: 0.95,
                          
                          child: Container(
                            
                            height: 95,
                            width: double.infinity,
                            padding:EdgeInsetsGeometry.only(top: 20,bottom: 30,left: 30,right: 10),
                            child: ElevatedButton(
                              
                              onPressed: (){

                                ref.watch(providerFiltri.notifier).setOrdine(ordine);

                                if(stato!=null){
                                  ref.watch(providerFiltri.notifier).setStato(stato!);
                                }

                                final controller=ref.watch(providerFiltri.notifier); 
                                if(accAl!=null)
                                ref.watch(providerFiltri.notifier).setAccAl(accAl!);
                                if(accAl==null)
                                ref.watch(providerFiltri.notifier).clearAccAl();

                                if(accDal!=null)
                                ref.read(providerFiltri.notifier).setAccdal(accDal!);
                                if(accDal==null)
                                ref.watch(providerFiltri.notifier).clearAccDal();

                                if(rdpDal!=null)
                                ref.read(providerFiltri.notifier).setRdpDal(rdpDal!);
                                if(rdpDal==null)
                                ref.watch(providerFiltri.notifier).clearRdpDal();

                                if(rdpAl!=null)
                                ref.read(providerFiltri.notifier).setRdpAl(rdpAl!);
                                if(rdpAl==null)
                                ref.watch(providerFiltri.notifier).clearRdpAl();

                                if(controller.vetController.text.isNotEmpty)
                                ref.watch(providerFiltri.notifier).setVet(controller.vetController.text);
                                if(controller.vetController.text.isEmpty)
                                ref.watch(providerFiltri.notifier).clearVet();

                                if(controller.richController.text.isNotEmpty)
                                ref.read(providerFiltri.notifier).setRich(controller.richController.text);
                                if(controller.richController.text.isEmpty)
                                ref.watch(providerFiltri.notifier).clearRich();

                                if(controller.ragController.text.isNotEmpty)
                                ref.watch(providerFiltri.notifier).setRag(controller.ragController.text);
                                if(controller.ragController.text.isEmpty)
                                ref.watch(providerFiltri.notifier).clearRag();

                                if(controller.codController.text.isNotEmpty)
                                ref.watch(providerFiltri.notifier).setCod(controller.codController.text);
                                if(controller.codController.text.isEmpty)
                                ref.watch(providerFiltri.notifier).clearCod();

                                if(quesSel!=null)
                                ref.watch(providerFiltri.notifier).setQue(quesSel!);
                                if(quesSel=='Tutti')
                                ref.watch(providerFiltri.notifier).clearQue();

                                if(controller.verbController.text.isNotEmpty)
                                ref.watch(providerFiltri.notifier).setVerb(controller.verbController.text);
                                if(controller.verbController.text.isEmpty)
                                ref.watch(providerFiltri.notifier).clearVerb();

                                context.go('/ricerca');



                              },
                              child: Text('Applica Filtri',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                              ),
                            ),
                        )
                      
                     
                    ],
                  )
                ),
              
            
            
          ],
          
        ),
    ),
    ),],
        ),
    );
  }

 


}
