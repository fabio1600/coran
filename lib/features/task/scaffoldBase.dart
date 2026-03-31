
import 'package:coran/features/task/home.dart';
import 'package:coran/features/task/impostazioni.dart';
import 'package:coran/features/task/paginaPreferiti.dart';
import 'package:coran/features/task/ricerca.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'filtriNotifier.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  final int currentIndex;
  // opzionale, se vuoi sostituire IndexedStack

  const BaseScaffold({
    Key? key,
    this.currentIndex = 0, // valore di default
   
  }) : super(key: key);

  @override
  ConsumerState<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Ricerca(),
    Paginapreferiti(),
    Impostazioni(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
        _currentIndex == 0 ? 'Home' :
        _currentIndex == 1 ? 'Ricerca' :
        _currentIndex == 2 ? 'Preferiti' : 'Impostazioni'
      ),
      centerTitle: true,
      actions: [
        if (_currentIndex == 1)...[
        Center(child:Text('Filtri')),
        IconButton( icon: const Icon(Icons.filter_list), onPressed: () { context.push('/filtri'); }, ),
        ]
      ],
      
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        
        onTap: (index) => setState(() => _currentIndex = index),
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Ricerca'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Preferiti',),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Impostazioni'),
        ],
      ),
    );
  }
}