import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;


  const BaseScaffold({
    required this.body,
    required this.currentIndex,
    
    super.key,
  });

 




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: currentIndex == 0 
                  ? Text('Home') 
              : currentIndex == 1 
                  ? Text('Ricerca') 
              : currentIndex == 2
                  ? Text('Impostazioni')
                  : null,
        centerTitle: true,
        actions: [
        if (currentIndex == 1)
         // solo nella prima pagina
        IconButton(
        icon: const Icon(Icons.filter_list),
        onPressed: () {
          context.push('/filtri');
        },
      ),
      
  ],
  
      ),
      body: Container(
        color: Colors.white,
        child:  body
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                context.pushReplacement('/home');
                break;
              case 1:
                context.go('/ricerca');
                break;
              case 2:
                context.go('/rdp');
                break;
              
            }
          },
          backgroundColor: const Color.fromARGB(255, 240, 250, 255),
          selectedItemColor: const Color(0xFF209BD6),
          items: [
            BottomNavigationBarItem(
              
              icon:Icon(Icons.home),
              label: 'Home'
              ),
            BottomNavigationBarItem(
              icon:Icon(Icons.search),
              label: 'Search'
              ),
            BottomNavigationBarItem(
              icon:Icon(Icons.settings),
              label: 'Settings'
              )
          ],
          
        ),

    );
  }
}