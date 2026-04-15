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
      home:timmer(),
    );
  }
}

class timmer extends StatefulWidget {
  const timmer({super.key});

  @override
  State<timmer> createState() => _timmerState();
}

class _timmerState extends State<timmer> {

  int _startTimer=10;

  void reset(){
    if(_startTimer<=0){
      _startTimer=10;
    }
  }

  void CountDown() async {
    while (_startTimer > 0) {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      setState(() {
        _startTimer--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Down', style: TextStyle(
          fontSize: 20,

        ),),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 400,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.brown[50],
            border: Border.all(color: Colors.brown, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_startTimer',
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(onPressed: (){
                CountDown();
              }, child: Text('CountDown'),),

              SizedBox(height:10 ,),

              ElevatedButton(onPressed: (){
                setState(() {
                  _startTimer = 10;
                });
              }, child: Text('Reset')),

            ],
          ),
        ),
      ),
    );
  }
}
