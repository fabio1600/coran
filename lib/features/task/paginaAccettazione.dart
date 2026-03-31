
import 'package:coran/features/task/accettazioniNotifier.dart';
import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/rdpNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'sharePdf.dart';
import 'filtriNotifier.dart';

class paginaAccettazione extends ConsumerStatefulWidget {
final int id;

  const paginaAccettazione({required this.id});

  


  @override
  ConsumerState<paginaAccettazione> createState() => _paginaAccettazioneState();
}
class _paginaAccettazioneState extends ConsumerState<paginaAccettazione> {
 


List<Rdp> rapportiDiProva=[];
  
  

 @override
  Widget build(BuildContext context) {
    final accettazione=ref.watch(providerAccettazione).firstWhere((element) => element.id==widget.id);
    if(accettazione.RapportiDiProva!=null){
       rapportiDiProva= ref.watch(providerRdp).where((element)=>accettazione.RapportiDiProva!.contains(element.id)).toList();
       if(rapportiDiProva.any((a)=>a.letto==false)){
        
        rapportiDiProva.sort((a,b)=>b.positivo.toString().compareTo(a.positivo.toString()));
        rapportiDiProva.sort((a,b)=>a.letto.toString().compareTo(b.letto.toString()));
        
        
       }else{
        rapportiDiProva.sort((a,b)=>b.id.compareTo(a.id));
       }
       
    }
    

    return  Scaffold(
      appBar: AppBar(
        title: Text('Richiesta ${accettazione.id}'),
                              
        centerTitle: true,
        actions: [
          
          IconButton( icon: accettazione.preferito==true ? Icon(Icons.star) : Icon(Icons.star_border), onPressed: () {
            ref.read(providerAccettazione.notifier).setPreferito(accettazione);
            if(accettazione.preferito==true){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.blue,
                                        content: const Text("Rimosso dai preferiti!",style: TextStyle(fontSize: 16),),
                                        behavior: SnackBarBehavior.floating,
                                        margin: const EdgeInsets.all(20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        duration: const Duration(seconds: 3),
                                      ),
                                  );
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.blue,
                                        content: const Text("Aggiunto ai preferiti!",style: TextStyle(fontSize: 16),),
                                        behavior: SnackBarBehavior.floating,
                                        margin: const EdgeInsets.all(20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        duration: const Duration(seconds: 3),
                                      ),
                                  );
                                  }
           }, ),
        ],
        
      ),
      body:Column(
          children: [
           Expanded(
            child: ListView(
              
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(padding:EdgeInsetsGeometry.only(top: 20)),
                        FractionallySizedBox(
                          widthFactor: 0.95,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 236, 236, 236)
                              ),
                            child:FractionallySizedBox(
                              widthFactor: 0.9,
                              child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsGeometry.only(top: 15,right: 5),
                                  child: Text('DATA ACCETTAZIONE',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(top: 7),
                                  child: Text('${DateFormat('dd/MM/yyyy').format(accettazione.DataAccettazione)}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  
                                ),
                        
                    
                      
                                Padding(
                                  padding: EdgeInsetsGeometry.only(left: 0),

                                  child: Text('ATTIVITÀ',style: TextStyle(fontSize: 17),),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(top: 7,right: 5),
                                  child: Text('${accettazione.Attivita}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                               Center(
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  
                                ),
                        
                      
                                Text('INDIRIZZO',style: TextStyle(fontSize: 17)),
                                
                                Padding(
                                  padding: EdgeInsetsGeometry.only(top: 7,right: 5),
                                  child: Text('${accettazione.Indirizzo}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  
                                ),
                        
                      
                      
                                Text('RICHIEDENETE',style: TextStyle(fontSize: 17),),
                                
                                Padding(
                                  padding: EdgeInsetsGeometry.only(top: 7,right: 5),
                                  child: Text('${accettazione.Richiedente}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  
                                ),
                        
                      
                                Text('QUESITO',style: TextStyle(fontSize: 17),),
                                
                                Padding(
                                  padding: EdgeInsetsGeometry.only(top: 7,right: 5),
                                  child: Text('${accettazione.Quesito}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  
                                ),
                          
                        
                      
                                Text('UTENTE',style: TextStyle(fontSize: 17),),
                                
                                Padding(
                                  padding: EdgeInsetsGeometry.only(top: 7,right: 5),
                                  child: Text('${accettazione.Utente}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  
                                ),
                          
                        
                      
                                Text('CODICE AZIENDA',style: TextStyle(fontSize: 17),),
                                
                                Padding(
                                  padding: EdgeInsetsGeometry.only(top: 7,right: 5),
                                  child: Text('${accettazione.CodiceAzienda}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  
                                ),
                          
                        
                      
                                Text('ASL',style: TextStyle(fontSize: 17),),
                                
                                Padding(
                                  padding: EdgeInsetsGeometry.only(top: 7,right: 5),
                                  child: Text('${accettazione.Asl}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                ),
                                Center(
                                    child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 1,
                                    color: const Color.fromARGB(255, 189, 188, 188),
                                    ),
                                  
                                ),

                                Text('ALLEGATI PRESENTI',style: TextStyle(fontSize: 17),),
                                
                                Padding(
                                  padding: EdgeInsets.only(top: 7, bottom: 20),
                                  child: Row(
                                    
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${accettazione.Allegati}',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),InkWell(
                                        onTap: (){
                                          sharePdf();
                                        },
                                     
                                      child: Icon(Icons.download),
                                    ),
                                      
                                    ],
                                  ),
                                )
                              ],
                            ),
                            )
                            
                    
                          ),
                        ),
                        Row(
                            children: [
                              Padding(
                                padding: EdgeInsetsGeometry.only(left: 11,top: 30,bottom: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.fact_check_outlined),
                                    SizedBox(width: 8,),
                                    Text('${rapportiDiProva.length} RAPPORTI DI PROVA',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    
                                  ],
                                  ) 
                              ),
                            ],
                          ),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: rapportiDiProva.length,
                          itemBuilder: (context,index){
                            final item=rapportiDiProva[index];
                            return FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 0.95,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 5) ,
                            child:SizedBox(
                              
                              child:ElevatedButton(
                                style:item.positivo==true&&item.letto==false ? ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(117, 238, 72, 108)) : item.letto==false ? ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(157, 80, 200, 255)) : ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(157, 197, 207, 213)),
                                onPressed: (){
                                  ref.watch(providerRdp.notifier).setLetto(item);
                                  if(rapportiDiProva.where((item)=>item.letto==false).length==1){
                                    ref.watch(providerAccettazione.notifier).modStato('Letto', accettazione);
                                  }
                                  context.push('/rdp');
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
                                                        child: Text('RDP',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text(item.id.toString(),
                                                                      style: TextStyle(fontSize: 16,color:Colors.black87,fontWeight: FontWeight.bold)
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
                                                        child: Text('Conferimento',
                                                            style: TextStyle(fontSize: 16,color:  Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text(item.conferimento,
                                                                      style: TextStyle(fontSize: 16,color:Colors.black87,fontWeight: FontWeight.bold)
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
                                                        child: Text('Tipo',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text(item.tipo,
                                                                      style: TextStyle(fontSize: 16,color:Colors.black87,fontWeight: FontWeight.bold)
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
                                                        child: Text('Specie',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text(item.specie,
                                                                      style: TextStyle(fontSize: 16,color:Colors.black87,fontWeight: FontWeight.bold)
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
                                                        child: Text('Campioni',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text(item.campioni,
                                                                      style: TextStyle(fontSize: 16,color:Colors.black87,fontWeight: FontWeight.bold)
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
                                                        child: Text('Data Rdp',
                                                            style: TextStyle(fontSize: 16,color: Colors.black54)
                                                          ),
                                                      ),
                                                      Expanded(
                                                        child:Padding(
                                                          padding:EdgeInsetsGeometry.only(left: 25),
                                                          child: Text(DateFormat('dd/MM/yyyy').format(item.data!),
                                                                      style: TextStyle(fontSize: 16,color:Colors.black87,fontWeight: FontWeight.bold)
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
                                                      item.positivo==true ? Icon(Icons.error_outline,color: Colors.black,) : SizedBox.shrink(),
                                                      
                                                      
                                                      ],
                                                    ),
                                          
                                          )
                                        ),
                                          
                                  ],
                                ),
                                ),
                            ),
                          ),
                        );
                          }
                        ),
                        
                        
                        
                      ],
              
                    ),
                  ),
                ],
              
            ),
           ),
          ],
        
        
    ),
      
    );
  }

 


}
