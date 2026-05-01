// ignore_for_file: override_on_non_overriding_member

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_practic_eapp/lab13/data/database.dart';
import 'package:lab_practic_eapp/lab13/utils/dailogbox.dart';
import 'package:lab_practic_eapp/lab13/utils/todo_tiles.dart';

class Hivehomepage extends StatefulWidget {
  const Hivehomepage({super.key});

  @override
  State<Hivehomepage> createState() => _HivehomepageState();
}

class _HivehomepageState extends State<Hivehomepage> {
  late final Box _box;
  @override
  void initState() {
    _box = Hive.box('mybox');
    super.initState();
    if (_box.get("task") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    _controller.add(List<List<dynamic>>.from(db.todo));
  }

  Database db = Database();
  final TextEditingController _dailogboxController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final StreamController<List<List<dynamic>>> _controller =
      StreamController<List<List<dynamic>>>.broadcast();
  @override
  void dispose() {
    _textController.dispose();
    _dailogboxController.dispose();
    _controller.close();
    super.dispose();
  }

  //check box change
  void checkboxChange(bool? value, int index) {
    setState(() {
      db.todo[index][1] = !db.todo[index][1];
      db.updateData();
      searchQuery(_textController.text);
    });
  }

  // Search logic
  void searchQuery(String query) {
    if (query.isEmpty) {
      _controller.add(List<List<dynamic>>.from(db.todo));
    } else {
      final suggestion = db.todo
          .where((item) =>
              item[0].toString().toLowerCase().contains(query.toLowerCase()))
          .map((e) => e as List<dynamic>) // Ensure specific typing
          .toList();
      _controller.add(suggestion);
    }
  }

  //create the new task
  void newtask() {
    _dailogboxController.clear();
    showDialog(
      context: context,
      builder: (context) => Dailogbox(
        controller: _dailogboxController,
        onSave: () {
          setState(() {
            db.todo.add([_dailogboxController.text, false]);
            searchQuery(_textController.text);
          });
          Navigator.of(context).pop();
        },
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  //delete task
  void deletetask(index) {
    setState(() {
      db.todo.removeAt(index);
      searchQuery(_textController.text);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Task Managment',
            style: GoogleFonts.dynaPuff(
              color: const Color.fromARGB(255, 45, 45, 45),
            ),
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.lightGreenAccent,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            //search bar to find the db.todo Task
            TextField(
              controller: _textController,
              onChanged: searchQuery,
              style: GoogleFonts.dynaPuff(),
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.yellow[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                ),
              ),
            ),
            //db.todo tile
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<List<List<dynamic>>>(
                stream: _controller.stream,
                initialData: List<List<dynamic>>.from(db.todo),
                builder: (context, asyncSnapshot) {
                  final displayList = asyncSnapshot.data ?? [];
                  return ListView.builder(
                    itemCount: displayList.length,
                    itemBuilder: (context, index) {
                      return TodoTiles(
                        task: displayList[index][0],
                        isCompleted: displayList[index][1],
                        onChanged: (value) {
                          int realIndex = db.todo.indexOf(displayList[index]);
                          checkboxChange(value, realIndex);
                        },
                        deletetask: () =>
                            deletetask(db.todo.indexOf(displayList[index])),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newtask();
        },
        backgroundColor: const Color.fromARGB(255, 36, 68, 0),
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
