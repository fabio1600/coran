
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class Ricerca extends ConsumerStatefulWidget {


  const Ricerca({super.key});


  @override
  ConsumerState<Ricerca> createState() => _RicercaState();
}
class _RicercaState extends ConsumerState<Ricerca> {

 @override
  Widget build(BuildContext context) {
    bool test=true;

    return ListView( children: [
            Padding(padding:EdgeInsetsGeometry.only(top: 20)),
            Center(
              child: 
              Text('data')
            ),
            
            
          ],
          
        );
    
        
  }

 


}
