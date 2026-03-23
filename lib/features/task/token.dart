import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ShowTokenScreen extends StatefulWidget {
  const ShowTokenScreen({super.key});

  @override
  State<ShowTokenScreen> createState() => _ShowTokenScreenState();
}

class _ShowTokenScreenState extends State<ShowTokenScreen> {
  String text = "Caricando...";

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    try {
      final settings = await FirebaseMessaging.instance.getNotificationSettings();
      setState(() {
        text = "Stato permessi: ${settings.authorizationStatus}";
      });

      if (settings.authorizationStatus == AuthorizationStatus.notDetermined) {
        await FirebaseMessaging.instance.requestPermission();
      }

      final token = await FirebaseMessaging.instance.getToken();
      setState(() {
        text = token ?? "TOKEN NULL — controlla Info.plist / APNs key";
      });
    } catch (e) {
      setState(() {
        text = "ERRORE: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FCM Token")),
      body: Center(
        child: SelectableText(text),
      ),
    );
  }
}