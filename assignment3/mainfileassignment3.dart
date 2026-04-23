import 'package:flutter/material.dart';
import 'package:lab_practic_eapp/assignment3/inheritedwidget-setstate.dart';

//Abdullah Khan 514779
void main(){
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber), //seed for the inherited widget
      ),
      home: InheritedwidgetANDsetstate(),
    );
  }
}