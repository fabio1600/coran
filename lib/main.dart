
import 'dart:convert';
import 'package:coran/features/task/Allegato.dart';
import 'package:http/http.dart' as http;
import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/paginaRdp.dart';
import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/utente.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:coran/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  


  await Hive.initFlutter();
Hive.registerAdapter(AccettazioneAdapter());
Hive.registerAdapter(UtenteAdapter());
Hive.registerAdapter(RdpAdapter());
Hive.registerAdapter(AllegatoAdapter());
  await Hive.openBox<Accettazione>('accettazioni');

  await Hive.openBox('login');
  await Hive.openBox<Utente>('utente');
  await Hive.openBox<Rdp>('rdp');
  await Hive.openBox('preferiti');

  var box = Hive.box('login');
  bool isLogged = box.get('isLogged', defaultValue: false);

 
  

  


  runApp(
    ProviderScope(
      child: MyApp(isLogged:isLogged),
    ),
  );

 
}
class MyApp extends StatefulWidget {

  final bool isLogged;

  MyApp({required this.isLogged});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          foregroundColor: Colors.black,
        ),
        useMaterial3: false,
        
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('it'), // italiano
        Locale('en'), // inglese
      ],
    );
  }
}