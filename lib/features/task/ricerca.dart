
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'filtriNotifier.dart';


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
  

 @override
  Widget build(BuildContext context) {
    
    bool test=true;
final filtri=ref.watch(providerFiltri);
    return 
    Column(
          children: [
           
            Expanded(child: SingleChildScrollView(child: Column( children: [
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
                
                
              ],
            ),
              ),
               
            Center( 
              child: 
              FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 10) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 80, 200, 255)),
                                onPressed: (){
                                  context.push('/accettazione');
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
                                                          child: Text('2186323/SS',
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
                                                          child: Text('25/02/2026',
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
                                                          child: Text('PATOLOGIE ANIMALI DA AFFEZIONE - CANE',
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
                                                          child: Text('SOCIETA AGRICOLA TRES CORONAS S.S.',
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
                                                          child: Text('IT052SS299',
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
                                                          child: Text('OZIERI',
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
                                                      Icon(Icons.picture_as_pdf,color: Colors.black,),
                                                      Icon(Icons.attach_file,color: Colors.black,)
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
            ),
             Center( 
              child: 
              FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 10) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 197, 207, 213)),
                                onPressed: (){
                                  context.push('/accettazione');
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
                                                          child: Text('2186003/SS',
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
                                                        child: Text('Data accettazione',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('02/02/2026',
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
                                                          child: Text('TRIC3: RICERCA TRICHINELLA - MACELLAZIONI USO FAMILIARE',
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
                                                          child: Text('SINI SALVATORE',
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
                                                          child: Text('IT052SS862',
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
                                                          child: Text('OTTANA',
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
                                                      Text('Analisi in corso...',style: TextStyle(fontSize: 16,color: Colors.black87),)
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
            ),
            Center( 
              child: 
              FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 10) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(117, 238, 72, 108)),
                                onPressed: (){
                                  context.push('/accettazione');
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
                                                          child: Text('2186658/SS',
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
                                                        child: Text('Data accettazione',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 0),
                                                          child: Text('14/02/2026',
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
                                                          child: Text('PATOLOGIE ANIMALI DA AFFEZIONE - CANE',
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
                                                          child: Text('OFFEDU E PALA S.S.',
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
                                                          child: Text('IT052SS128',
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
                                                          child: Text('ORUNE',
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
                                                      Icon(Icons.picture_as_pdf,color: Colors.black,),
                                                      Icon(Icons.attach_file,color: Colors.black,)
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
            ),
          ],
          
        ),
    ),
    ),],
        );
        
  }

 


}
