import 'package:flutter/cupertino.dart';
import 'package:lab_practic_eapp/lab10task1/model/todo_data.dart';

enum Todofilter{all , active , isCompleted}
class TodoProvider extends ChangeNotifier {
  final List<TodoData> _todo =[];

  Todofilter _filter=Todofilter.all;

  Todofilter get filter => _filter;

  List<TodoData> get filtertodos{
    switch(_filter){
      case Todofilter.active:
        return _todo.where((t)=>!t.isCompleted).toList();
      case Todofilter.isCompleted:
        return _todo.where((t)=>t.isCompleted).toList();
      default:
        return List.unmodifiable(_todo);
    }
  }

  int get completedcount => 
    _todo.where((t)=>t.isCompleted).length;

  //actions 
  void addTodo(String title){
    if(title.trim().isEmpty) return;
    _todo.add(TodoData(title: title.trim()));
    notifyListeners();
  }

  void toggleTodo(String id){
    final todo = _todo.firstWhere((t)=>t.id==id);
    todo.isCompleted=!todo.isCompleted;
    notifyListeners();
  }

  void deletetodo(String id){
    _todo.removeWhere((t)=>t.id==id );
    notifyListeners();
    }
  void setfilter(Todofilter f){
    _filter=f;
    notifyListeners();
  }

}
