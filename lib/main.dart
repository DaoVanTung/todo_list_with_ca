import 'package:flutter/material.dart';

import 'injector.dart';
import 'src/presentation/pages/todo_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final injector = Injector();
    final todoChangeNotifier = injector.provideTodoChangeNotifier();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoListPage(todoChangeNotifier: todoChangeNotifier),
    );
  }
}
