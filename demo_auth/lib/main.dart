import 'package:demo_auth/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAuAyK60R4noVzarOykzadFS_WamY3O5F8",
          appId: "1:758891487433:android:2efece2b040e0a409ced18",
          messagingSenderId: "758891487433",
          projectId: "teammanagement-dbba4"));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
