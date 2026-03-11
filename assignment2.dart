// Create a Simple Profile Card

// Key Tasks:

// 1. Design a simple profile CARD layout using basic layout widgets.

// 2. The card should display a profile picture, name, and a short description or bio.

// 3. Use Container, Column, and Row to arrange the profile elements.
// 4. Draw a Visual Layout Tree of the User Interface.

import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profilecard(),
    );
  }
}

class profilecard extends StatelessWidget {
  const profilecard({super.key});

  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      //app bar
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile',
         style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
         ),

        ),
        
        backgroundColor: Colors.black,
      ),
      //body for the card
     body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 30, 30, 30),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color.fromARGB(255, 74, 74, 74),
                width: 4,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Profile Image
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profile.jpg',
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Name
                const Text(
                  'Abdullah Khan',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                // Role
                const Text(
                  'Flutter Developer | UI/UX Designer | Data Analyst',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 15),

                // Description Title
                const Text(
                  '-: Description :-',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                // Description
                const Text(
                  'I am a passionate Flutter App Developer, UI/UX Designer, and Data Analyst with a strong interest in building efficient, user-friendly, and data-driven digital solutions. I specialize in developing cross-platform mobile applications using Flutter.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 205, 201, 201),
                  ),
                ),
              
              
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}