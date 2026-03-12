
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class Segnalazione extends ConsumerStatefulWidget {


  const Segnalazione({super.key});


  @override
  ConsumerState<Segnalazione> createState() => _SegnalazioneState();
}
class _SegnalazioneState extends ConsumerState<Segnalazione> {



  
 
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segnalazione'),
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
                      height: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 20),child: Text('Richiesta segnalazione',style: TextStyle(fontSize: 20),),),
                          TextField(
                            minLines: 5,
                            maxLines: 15,
                            decoration: InputDecoration(
                              
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                          
                            child:SizedBox(
                              height: 50,
                              width: 200,
                              child:ElevatedButton(
                              onPressed: (){},
                              child: Text('Invia segnalazione',style: TextStyle(fontSize: 18))
                              ),
                            ),
                          )
                        ],
                      ),
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