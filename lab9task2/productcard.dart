import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lab_practic_eapp/lab9task2/productpage.dart';

class Productcard extends StatefulWidget {
  final Image img;
  final String name;
  final double price;
  const Productcard({super.key, required this.img, required this.name, required this.price});

  @override
  State<Productcard> createState() => _ProductcardState();
}

class _ProductcardState extends State<Productcard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 200,
              width: 200,
              
              child: widget.img,
            ),
          ),
          //separation
          const SizedBox(height: 12,),
          Text(widget.name,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,
              ),
            const SizedBox(height: 4),
          // Product Price
          Text(
            "\$${widget.price.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 16,
              color: Colors.green.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
           const SizedBox(height: 4),

           ElevatedButton(onPressed: (){
            //navigation to product detail page
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
            ProductDetailsPage(name: widget.name, price: widget.price, img:widget.img ),
            ),);
           },
           style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
           ),
           child: Text('Read for more'))
        ],
      ),
    ) ;
  }
}