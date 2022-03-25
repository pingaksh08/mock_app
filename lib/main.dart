import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mock_app/crud.dart';
import 'package:mock_app/loginui.dart';
//import 'package:mock_app/write_op.dart';
import 'signin.dart';
import 'homepage.dart';
import '';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: login(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup': (context) => signup(),
        '/homepage': (context) => homepage(),
        '/crudop': (context) => crudop(),
      },
    );
  }
}
