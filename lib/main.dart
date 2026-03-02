

import 'package:coran/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(
     ProviderScope(
      child: MyApp(),
    ),
  );
  
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 168, 158, 158)),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          foregroundColor: Colors.black,
        ),
        useMaterial3: false,
      ),
    );
  }
}