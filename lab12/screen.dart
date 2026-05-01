import 'package:flutter/material.dart';
import 'dart:async';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  final TextEditingController _textController = TextEditingController();
  final StreamController<List<String>> _controller = StreamController<List<String>>.broadcast();

  //list for the products to add
  List<String> products=['photo','gallery','fruits','vegetables','chargers'];
  @override
  void dispose() {
    _controller.close();
    _textController.dispose();
    super.dispose();
  }

  //for the query optimization
  void SearchQuery(String query){
    if(query.isEmpty){
      _controller.add([]);
    }
    else{
      final suggestion=products.where((items)=>items.toLowerCase().contains(query.toLowerCase())).toList();
      _controller.add(suggestion);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Search'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onChanged: SearchQuery,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search...',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: StreamBuilder<List<String>>(
                  stream: _controller.stream,
                  initialData: const [],
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No Results'));
                    }
                    final result = snapshot.data!;
                    return ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(result[index]));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
