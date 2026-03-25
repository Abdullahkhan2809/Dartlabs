import 'package:flutter/material.dart';
import 'package:lab_practic_eapp/screenslab9/home.dart';
import 'package:lab_practic_eapp/screenslab9/menu.dart';
import 'package:lab_practic_eapp/screenslab9/profile.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routes for the navigation by abdullah khan 514779',
      initialRoute: '/',
      routes: {
        '/':(context)=>HomeScreen(),
        '/second':(context)=>Menu(),
        '/third':(context)=>Profile(),
      },
    );
  }
}