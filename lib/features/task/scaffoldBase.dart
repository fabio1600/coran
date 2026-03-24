import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/home.dart';
import 'package:coran/features/task/impostazioni.dart';
import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/ricerca.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScaffold extends StatefulWidget {
  final int currentIndex;
  // opzionale, se vuoi sostituire IndexedStack

  const BaseScaffold({
    Key? key,
    this.currentIndex = 0, // valore di default
   
  }) : super(key: key);

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Ricerca(),
    Impostazioni(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        _currentIndex == 0 ? 'Home' :
        _currentIndex == 1 ? 'Ricerca' : 'Impostazioni'
      ),
      centerTitle: true,
      actions: [
        if (_currentIndex == 1)
        Text('Filtri'),
        IconButton( icon: const Icon(Icons.filter_list), onPressed: () { context.push('/filtri'); }, ),
      ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Ricerca'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Impostazioni'),
        ],
      ),
    );
  }
}