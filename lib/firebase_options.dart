// File generato manualmente a partire dalla tua firebaseConfig Web
// Posiziona questo file in: lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'dart:io' show Platform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (Platform.isIOS || Platform.isMacOS) {
      return ios;
    } else if (Platform.isAndroid) {
      return android;
    } else {
      return web;
    }
  }

  // 🌐 WEB
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBYC8cvLAvc57GNxOlA8CLxDiCjWe-FvdQ",
    authDomain: "coran-a8c9f.firebaseapp.com",
    projectId: "coran-a8c9f",
    storageBucket: "coran-a8c9f.firebasestorage.app",
    messagingSenderId: "223818966931",
    appId: "1:223818966931:web:715337807efd6fc5152a66",
    measurementId: "G-2VY1T9XWC5",
  );

  // 📱 ANDROID (prende gli stessi valori del Web tranne appId)
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBYC8cvLAvc57GNxOlA8CLxDiCjWe-FvdQ",
    authDomain: "coran-a8c9f.firebaseapp.com",
    projectId: "coran-a8c9f",
    storageBucket: "coran-a8c9f.firebasestorage.app",
    messagingSenderId: "223818966931",
    appId: "1:223818966931:android:715337807efd6fc5152a66", 
    measurementId: null,
  );

  // 🍎 iOS (stessi valori del Web tranne appId)
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyBYC8cvLAvc57GNxOlA8CLxDiCjWe-FvdQ",
    authDomain: "coran-a8c9f.firebaseapp.com",
    projectId: "coran-a8c9f",
    storageBucket: "coran-a8c9f.firebasestorage.app",
    messagingSenderId: "223818966931",
    appId: "1:223818966931:ios:715337807efd6fc5152a66",
    measurementId: "G-2VY1T9XWC5",
  );
}