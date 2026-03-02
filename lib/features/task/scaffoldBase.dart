import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: Image.asset('assets/images/app_icon.png',
  width: 50,) ,
        centerTitle: true,
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 212, 237, 248),
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