import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ShowTokenScreen extends StatefulWidget {
  const ShowTokenScreen({super.key});

  @override
  State<ShowTokenScreen> createState() => _ShowTokenScreenState();
}

class _ShowTokenScreenState extends State<ShowTokenScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final t = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FCM Token")),
      body: Center(
        child: token == null
            ? const CircularProgressIndicator()
            : SelectableText(
                token!,
                style: const TextStyle(fontSize: 16),
              ),
      ),
    );
  }
}