import 'package:flutter/widgets.dart';
class TodoData {
  final String id;
  final String title;
  bool isCompleted;

  TodoData({
    String? id,
    required this.title,
    this.isCompleted=false,
  }): id = id ?? UniqueKey().toString();
}