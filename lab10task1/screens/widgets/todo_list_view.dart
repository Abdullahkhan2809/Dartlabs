import 'package:flutter/material.dart';
import 'package:lab_practic_eapp/lab10task1/provider/todo_provider.dart';
import 'package:lab_practic_eapp/lab10task1/screens/widgets/todo_tile.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoProvider>().filtertodos;

    if (todos.isEmpty) {
      return const Center(
        child: Text(
          'No tasks here!',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (_, i) => TodoTile(todo: todos[i]),
    );
  }
}