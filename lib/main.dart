/*import 'package:firebase_messaging/firebase_messaging.dart';*/
import 'package:firebase_core/firebase_core.dart';
import 'package:coran/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  


  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   /*@override
  void initState() {
    super.initState();
    initFirebaseMessaging();
  }

  Future<void> initFirebaseMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission();

    String? token = await messaging.getToken();

    print("TOKEN: $token");
  }*/

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