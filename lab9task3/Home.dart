import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        backgroundColor: Colors.amber,

        ),
      drawer: Drawer(
        child: ListView(
          children: [
             DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text('Home'),
              onTap: (){
                Navigator.pushNamed(context, '/');
              },
            ),
            
            ListTile(
              title: Text('About'),
              onTap: (){
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: (){
                Navigator.pushNamed(context,'/profile' );
              },
            ),
            
          ],
        ),
      
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}