import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoTiles extends StatefulWidget {
  final String task;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final VoidCallback? deletetask;
  const TodoTiles({super.key, required this.task,required this.isCompleted, required this.onChanged, required this.deletetask});

  @override
  State<TodoTiles> createState() => _TodoTilesState();
}

class _TodoTilesState extends State<TodoTiles> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Checkbox(
            value: widget.isCompleted,
            onChanged: widget.onChanged,
            activeColor: Colors.black,
          ),
          Text(
            widget.task,
            style: GoogleFonts.dynaPuff(
              decoration: widget.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            )

          
          ),
          Spacer(),
          IconButton(onPressed: () {
            if (widget.deletetask != null) widget.deletetask!();
          }, icon: Icon(Icons.delete, color: Colors.white70,))
        ],
      ),
    );
  }
}