import 'package:flutter/material.dart';

class InheritedwidgetANDsetstate extends StatefulWidget {
  const InheritedwidgetANDsetstate({super.key});

  @override
  State<InheritedwidgetANDsetstate> createState() => _InheritedwidgetANDsetstateState();
}

class _InheritedwidgetANDsetstateState extends State<InheritedwidgetANDsetstate> {
  int _counter=0;

  void increment(){ //Setstate with in the class
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Inheritedwidget AND setstate'),
      ),
      body: Center(
        child: Text('$_counter',style: TextStyle(
          fontSize: 48,
        ),),
      ) ,
      floatingActionButton: FloatingActionButton(onPressed: 
      increment,
      backgroundColor: Theme.of(context).colorScheme.primary, //inheritedwidget can be used with in the tree
      child: Icon(Icons.add),
      ),
    );
  }
}