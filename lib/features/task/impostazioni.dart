
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';




class Impostazioni extends ConsumerStatefulWidget {


  const Impostazioni({super.key});


  @override
  ConsumerState<Impostazioni> createState() => _ImpostazioniState();
}
class _ImpostazioniState extends ConsumerState<Impostazioni> {
  
 
@override
  Widget build(BuildContext context) {
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
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Privacy',style: TextStyle(fontSize: 20),),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  
                  SizedBox(height: 200),

                  Text(
                    'Versione 1.0.0',
                    style: TextStyle(color: Colors.grey),
                  ),

                  SizedBox(height: 10),

                  TextButton(
                    onPressed: () {},
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