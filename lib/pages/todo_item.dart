import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String task;
  final bool completed;
  final Function onToggle;
  final Function onRemove;

  TodoItem({
    required this.task,
    required this.completed,
    required this.onToggle,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            completed ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.deepPurple,
          ),
          onPressed: () => onToggle(),
        ),
        title: Text(
          task,
          style: TextStyle(
            decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () => onRemove(),
        ),
      ),
    );
  }
}
