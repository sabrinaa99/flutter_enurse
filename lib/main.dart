import 'package:flutter/material.dart';
import 'package:flutter_php/signup.dart';


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
          return SignupScreen();
        }),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Login Page',
//       home: SignupScreen(),
//       debugShowCheckedModeBanner: false,
      
//     );
//   }
// }
