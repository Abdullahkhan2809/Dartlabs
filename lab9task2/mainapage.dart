  import 'package:flutter/material.dart';
  import 'package:lab_practic_eapp/lab9task2/productcard.dart';


  class Mainapage extends StatelessWidget {
    const Mainapage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text('Furor', style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
        body: ListView(
          padding: EdgeInsets.all(20) ,
          //product cards
          children: [
            Productcard(img: Image.network('https://images.pexels.com/photos/4066293/pexels-photo-4066293.jpeg', fit:BoxFit.cover,), name: 'Classic Black Tee', price: 25.00,),
            const SizedBox(height: 20,),
            Productcard(img: Image.network('https://images.pexels.com/photos/5319577/pexels-photo-5319577.jpeg', fit:BoxFit.cover,), name: 'Hoodie', price: 55.00)
          ],
        ),
      );
    }
  }