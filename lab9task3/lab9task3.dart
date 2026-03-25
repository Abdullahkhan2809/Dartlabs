import 'package:flutter/material.dart';
import 'package:lab_practic_eapp/lab9task3/about.dart';
import 'package:lab_practic_eapp/lab9task3/home.dart';
import 'package:lab_practic_eapp/lab9task3/profile.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>Home(),
        '/about':(context)=>About(),
        '/profile':(context)=>Profile(),
      },
    );
  }
}