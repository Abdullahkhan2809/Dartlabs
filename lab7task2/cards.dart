import 'package:flutter/material.dart';

class labCards extends StatelessWidget {

  final String name;
  final String price;
  final int counter;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const labCards({
    super.key,
    required this.name,
    required this.price,
    required this.counter,
    required this.onAdd,
    required this.onRemove
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [

          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage('assets/image1.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(price)
            ],
          ),

          const Spacer(),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(79, 4, 19, 31),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text('$counter',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),

          const SizedBox(width: 10),

          ElevatedButton(
              onPressed: onAdd,
              child: const Icon(Icons.add, color: Colors.black)
          ),

          ElevatedButton(
              onPressed: onRemove,
              child: const Icon(Icons.remove, color: Colors.black)
          )

        ],
      ),
    );
  }
}