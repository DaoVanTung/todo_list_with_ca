import 'package:flutter/material.dart';

import '../../domain/entities/todo_entity.dart';
import '../change_notifiers/todo_change_notifier.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key, required this.todoChangeNotifier});

  final TodoChangeNotifier todoChangeNotifier;

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState() {
    super.initState();
    widget.todoChangeNotifier.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: AnimatedBuilder(
        animation: widget.todoChangeNotifier,
        builder: (context, snapshot) {
          final todos = widget.todoChangeNotifier.todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index].title),
                leading: Checkbox(
                  value: todos[index].isCompleted,
                  onChanged: (value) {
                    TodoEntity updatedTodo = todos[index].copyWith(
                      isCompleted: value,
                    );
                    widget.todoChangeNotifier.updateTodo(
                      updatedTodo,
                    );
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    widget.todoChangeNotifier.deleteTodo(todos[index].id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add ToDo'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Enter todo title...'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                TodoEntity newTodo = TodoEntity(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: titleController.text,
                  isCompleted: false,
                );
                widget.todoChangeNotifier.addTodo(newTodo);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
