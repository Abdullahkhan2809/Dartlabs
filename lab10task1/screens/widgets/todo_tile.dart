import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab_practic_eapp/lab10task1/provider/todo_provider.dart';
import 'package:lab_practic_eapp/lab10task1/model/todo_data.dart';

class TodoTile extends StatelessWidget {
  final TodoData todo;

  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) =>
            context.read<TodoProvider>().toggleTodo(todo.id),
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: todo.isCompleted ? Colors.grey : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () =>
            context.read<TodoProvider>().deletetodo(todo.id),
      ),
    );
  }
}