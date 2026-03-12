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
      home: responsivelayout(),
    );
  }
}

class responsivelayout extends StatelessWidget {
  const responsivelayout ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        title: Text('Responsive layout.',style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        ),
        backgroundColor: Colors.black,
      ),
      //responsive layout body
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5), 
          children: [
            // added  container 
            Stack(
              children: [
                // position the picture
                  Positioned.fill(
                    child: Image.asset('assets/image1.jpg',fit: BoxFit.cover,),
                  ),
                  // positioning the icon and text
                  Positioned(
                    bottom: 5,
                    child: 
                    Column(
                      children: [
                          Icon(Icons.favorite, color: Colors.red, size: 18),
                           SizedBox(width: 5),
                            Text(
                             "120 Likes",
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                              ),
                            ),
                      ],
                    )
            
                  ),
              ], 
            ),
            Stack(
              children: [
                  Positioned.fill(
                    child: Image.asset('assets/profile.jpg',fit: BoxFit.cover,),
                  ),
                  Positioned(
                    
                    bottom: 5,
                    child: 
                    Column(
                      children: [
                          Icon(Icons.favorite, color: Colors.red, size: 18),
                           SizedBox(width: 5),
                            Text(
                             "120 Likes",
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                              ),
                            ),
                      ],
                    )
            
                  ),
              ], 
            ),
            Stack(
              children: [
                  Positioned.fill(
                    child: Image.asset('assets/profile.jpg',fit: BoxFit.cover,),
                  ),
                  Positioned(
                    
                    bottom: 5,
                    child: 
                    Column(
                      children: [
                          Icon(Icons.favorite, color: Colors.red, size: 18),
                           SizedBox(width: 5),
                            Text(
                             "120 Likes",
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                              ),
                            ),
                      ],
                    )
            
                  ),
              ], 
            ),Stack(
              children: [
                  Positioned.fill(
                    child:  Image.asset('assets/image1.jpg',fit: BoxFit.cover,),
                  ),
                  Positioned(
                    
                    bottom: 5,
                    child: 
                    Column(
                      children: [
                          Icon(Icons.favorite, color: Colors.red, size: 18),
                           SizedBox(width: 5),
                            Text(
                             "120 Likes",
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                              ),
                            ),
                      ],
                    )
            
                  ),
              ], 
            ),
            
            
          
          ],
          ),
    );
  }
}