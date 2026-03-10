
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class Cambiopassword extends ConsumerStatefulWidget {


  const Cambiopassword({super.key});


  @override
  ConsumerState<Cambiopassword> createState() => _CambiopasswordState();
}
class _CambiopasswordState extends ConsumerState<Cambiopassword> {

 

  
 
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambio Password'),
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
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Password Attuale',style: TextStyle(fontSize: 20),),
                          TextField(
                            
                            
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nuova Password',style: TextStyle(fontSize: 20),),
                          TextField(
                            
                            
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ripeti Password',style: TextStyle(fontSize: 20),),
                          TextField(
                            
                            
                          )
                        ],
                      ),
                    ),
                    
                    SizedBox(
                      height: 50,
                      width: 200,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text('Aggiorna password',style: TextStyle(fontSize: 18),)
                      )
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