import 'package:flutter/material.dart';

void main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ShopPage(),
    );
  }
}

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int counter = 0;

  void counterIncrement() {
    setState(() {
      counter++;
    });
  }
  void counterdecreament(){
    setState(() {
      counter--;
      if(counter<0){counter=0;}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bismillah Mobile' ,style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),

      ),
      body: Center(
        child: Column(
          children: [
          
            //image of the product
             Container(
                margin: EdgeInsets.all(20),
                height: 300,
                width: 300,
                
               decoration:BoxDecoration( 
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(image: AssetImage('assets/image1.jpg'), fit: BoxFit.cover),
             ),
             ),
            //name of the product
            Title(color: Colors.black,
             child: Text('Nothing phone 2a',
            style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            ),
            )
            )
            ,
            Padding(padding: EdgeInsets.all(20), 
                  
            child:Column(
              children: [ 
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(79, 4, 19, 31),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('$counter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 20,),
              Center(
                child: Row(  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    ElevatedButton(onPressed: counterIncrement, child: Icon(Icons.add, color: Colors.black,)),
                    SizedBox(width: 20,),
                    ElevatedButton(onPressed: counterdecreament, child: Icon(Icons.remove, color: Colors.black,))
                  ],
                ),
              ),
                
          ],),),
            Text('Price: \$999',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}