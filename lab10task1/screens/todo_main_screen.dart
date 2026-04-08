import 'package:flutter/material.dart';
import 'package:lab_practic_eapp/lab10task1/screens/widgets/add_todo.dart';
import 'package:lab_practic_eapp/lab10task1/screens/widgets/filter_bar.dart';
import 'package:lab_practic_eapp/lab10task1/screens/widgets/todo_list_view.dart';


class TodoMainScreen extends StatefulWidget {
  const TodoMainScreen({super.key});

  @override
  State<TodoMainScreen> createState() => _TodoMainScreenState();
}

class _TodoMainScreenState extends State<TodoMainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 42, 42),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black87,
        title: Text('TASK TODO', style: TextStyle(
          fontWeight: FontWeight.w600,
        ),),
      ),
      body:   Column(
        children: [
          addTodo(),
          FilterBar(),
          Expanded(child: TodoListView()),
        ],
      ),
    );
  }
}