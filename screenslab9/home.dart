import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home screen'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/second');
            },
            child: Text('menu',style: TextStyle(fontWeight: FontWeight.bold),)),

            SizedBox(height: 10,),

                 ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/third');
            },
            child: Text('profile',style: TextStyle(fontWeight: FontWeight.bold),)),
          ],
        ),
      ),
    );
  }
}