import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: const Color.fromARGB(255, 23, 55, 24),
      ),
      body: Center(
        child: Text("Profile SCREEN"),
      ),
    );
  }
}