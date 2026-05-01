import 'package:hive_flutter/hive_flutter.dart';

class Database {
  List<List<dynamic>> todo=[];
  //refernce the box
  late final _box=Hive.box('mybox'); 

  //create
  void createInitialData(){
    todo=[];
    _box.put("task", todo);
  }

  //load data
  void loadData(){
    var _box = Hive.box('mybox');
    final data = _box.get("task");
  if (data != null && data is List) {
    todo = List<List<dynamic>>.from(data);
  } else {
    todo = [];
  }
  }

  //update 
  void updateData(){
    _box.put("task", todo);
  }
}