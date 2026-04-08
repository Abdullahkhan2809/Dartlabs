import 'package:flutter/material.dart';
import 'package:lab_practic_eapp/lab10task1/provider/todo_provider.dart';
import 'package:lab_practic_eapp/lab10task1/screens/todo_main_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> TodoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        home: TodoMainScreen(),
      ),
    );
  }
}