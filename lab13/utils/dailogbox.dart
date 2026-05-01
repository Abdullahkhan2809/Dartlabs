import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dailogbox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const Dailogbox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightGreenAccent,
      title: Text('Add New Task', style:GoogleFonts.dynaPuff(color:const Color.fromARGB(255, 45, 45, 45),fontSize: 24)),
      content: Container(
        height: 100,
        width: 200,
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: GoogleFonts.dynaPuff(),
              cursorColor: Colors.green,
              decoration: InputDecoration(
                hintText:'Add Task...' ,
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green), borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                ),

                filled: true,
                fillColor: Colors.yellow[200]
              ),
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 237, 255, 217),
                  foregroundColor: Colors.black45),
                  onPressed: onSave, 
                  child: Text('Add',style:GoogleFonts.dynaPuff(fontSize: 16),)),

                const SizedBox(width: 8,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 36, 68, 0),
                  foregroundColor: Colors.lightGreenAccent),
                  onPressed: onCancel, 
                  child: Text('Cancel',style:GoogleFonts.dynaPuff(fontSize: 14),)),

              ],
            )
            
          ],
        ),
      ),
    );
  }
}