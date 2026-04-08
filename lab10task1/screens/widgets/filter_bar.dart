import 'package:flutter/material.dart';
import 'package:lab_practic_eapp/lab10task1/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final current = context.watch<TodoProvider>().filter;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Todofilter.values.map((f) {
        final label = f.name[0].toUpperCase() + f.name.substring(1);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal:16),
          child: ChoiceChip(
            label: Text(label),
            selected: current == f,
            onSelected: (_) => context.read<TodoProvider>().setfilter(f),
            color: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.grey;
                }
                if (states.contains(WidgetState.hovered)) {
                  return Colors.grey[300];
                }
                return Colors.transparent;
              },
            ),
            
          ),
        );
      }).toList(),
    );
  }
}