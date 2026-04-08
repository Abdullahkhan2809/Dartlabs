import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab_practic_eapp/lab10task1/provider/todo_provider.dart';

class addTodo extends StatefulWidget {
  const addTodo({super.key});

  @override
  State<addTodo> createState() => _addTodoState();
}

class _addTodoState extends State<addTodo> {
  final _ctrl = TextEditingController();

  //submit function
  void _submit() {
    context.read<TodoProvider>().addTodo(_ctrl.text);
    _ctrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16  ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _ctrl,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              onSubmitted: (_) => _submit(),
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                hintText: 'Add a Task...',
                hintStyle: TextStyle(color: Colors.grey),

                border: OutlineInputBorder(),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
          ),

          const SizedBox(width: 4,),
          IconButton(onPressed: (){
            _submit();
          },

           icon: Icon(Icons.add, color: Colors.white,))
        ],
      ),
    );
  }
}
