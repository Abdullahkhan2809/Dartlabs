import 'package:flutter/material.dart';
import 'package:lab_practic_eapp/lab9task2/mainapage.dart';

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
        '/':(context)=>Mainapage(),
      },
    );
  }
}