import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_screen.dart';
import 'home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => LoginScreen(),
      'home_screen':(context) => HomeScreen(),
    },
  ));
}

