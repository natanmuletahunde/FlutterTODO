import 'package:flutter/material.dart';
import 'todo_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _todoList = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodoItem(String task) {
    setState(() {
      _todoList.add({'task': task, 'completed': false});
    });
    _controller.clear();
  }

  void _toggleTask(int index) {
    setState(() {
      _todoList[index]['completed'] = !_todoList[index]['completed'];
    });
  }

  void _removeTask(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Center(child: Text('Flutter To-Do List')),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              style: TextStyle(color: Colors.white),  // Text color set to white
              decoration: InputDecoration(
                hintText: 'Enter a new task',
                hintStyle: TextStyle(color: Colors.white70),  // Hint text color set to white with slight opacity
                filled: true,
                fillColor: Colors.deepPurple.shade500,  // Background color of the text field
                border: InputBorder.none,  // Remove the underline
                focusedBorder: InputBorder.none,  // Remove the underline when focused
                enabledBorder: InputBorder.none,  // Remove the underline when enabled
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add, color: Colors.white),  // Icon color set to white
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _addTodoItem(_controller.text);
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return TodoItem(
                  task: _todoList[index]['task'],
                  completed: _todoList[index]['completed'],
                  onToggle: () => _toggleTask(index),
                  onRemove: () => _removeTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
