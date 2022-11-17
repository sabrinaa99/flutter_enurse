import 'package:flutter/material.dart';
import 'package:flutter_php/profileview.dart';

// import 'package:flutter_php/qr_scanner.dart';
// import 'package:flutter_php/users/authentication/login_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'php',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: FutureBuilder(
        builder:(context, dataSnapShot){
          return ProfileView();
        }),
    );
  }
}

