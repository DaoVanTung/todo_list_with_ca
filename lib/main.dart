import 'package:flutter/material.dart';

import 'src/data/data_sources/todo_data_source.dart';
import 'src/data/repositories/todo_repository_impl.dart';
import 'src/domain/repositories/todo_repository.dart';
import 'src/domain/use_cases/todo_use_case.dart';
import 'src/presentation/change_notifiers/todo_change_notifier.dart';
import 'src/presentation/pages/todo_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoDataSource todoDataSource = TodoDataSource();
    final TodoRepository todoRepository = TodoRepositoryImpl(todoDataSource);
    final TodoUseCase todoUseCase = TodoUseCase(todoRepository);
    final todoChangeNotifier = TodoChangeNotifier(todoUseCase);

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
