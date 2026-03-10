import 'package:flutter/material.dart';
import 'package:lab_practic_eapp/cards.dart';

void main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ShopPage(),);
  }
}
 class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<int> counter = [0,0,0];
  void reset(){
    setState(() {
      counter=[0,0,0];
    });
  }
  void counterIncrement(int index){
    setState(() {
      counter[index]++;
    });
  }
  void counterdecreament(int index){
    setState(() {
      if(counter[index]>0){
        counter[index]--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Bismillah market', style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.black,
        ),
      body: Column(
        children: [
        labCards(name: 'Phone',
           price: "\$5000",
           counter: counter[0],
            onAdd:()=> counterIncrement(0),
            onRemove: ()=>counterdecreament(0),),
        labCards(name: 'Phone',
           price: "\$5000",
           counter: counter[1],
            onAdd:()=> counterIncrement(1),
            onRemove: ()=>counterdecreament(1),),
        labCards(name: 'Phone',
           price: "\$5000",
           
           counter: counter[2],
            onAdd:()=> counterIncrement(2),
            onRemove: ()=>counterdecreament(2),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: reset, child: Icon(Icons.refresh, color: Colors.black,)),
          )
        ],
      ),
    );
  }
}