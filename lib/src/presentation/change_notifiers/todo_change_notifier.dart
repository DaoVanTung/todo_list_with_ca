import 'package:flutter/material.dart';

import '../../domain/entities/todo_entity.dart';
import '../../domain/use_cases/todo_use_case.dart';

class TodoChangeNotifier extends ChangeNotifier {
  final TodoUseCase _todoUseCase;

  TodoChangeNotifier(this._todoUseCase);

  // Cache todo list
  List<TodoEntity> todos = [];

  //
  // bool isBusy = false;

  void getTodos() async {
    todos = await _todoUseCase.getTodos.execute();
    notifyListeners();
  }

  void addTodo(TodoEntity todo) async {
    await _todoUseCase.addTodo.execute(todo);
    getTodos();
  }

  void updateTodo(TodoEntity todo) async {
    await _todoUseCase.updateTodo.execute(todo);
    getTodos();
  }

  void deleteTodo(int id) async {
    await _todoUseCase.deleteTodo.execute(id);
    getTodos();
  }
}
