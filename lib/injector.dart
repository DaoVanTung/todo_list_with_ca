import 'src/data/data_sources/todo_data_source.dart';
import 'src/data/repositories/todo_repository_impl.dart';
import 'src/domain/repositories/todo_repository.dart';
import 'src/domain/use_cases/todo_use_case.dart';
import 'src/presentation/change_notifiers/todo_change_notifier.dart';

class Injector {
  static final Injector _singleton = Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  TodoDataSource provideTodoDataSource() {
    return TodoDataSource();
  }

  TodoRepository provideTodoRepository() {
    final TodoDataSource todoDataSource = provideTodoDataSource();
    return TodoRepositoryImpl(todoDataSource);
  }

  TodoUseCase provideTodoUseCase() {
    final TodoRepository todoRepository = provideTodoRepository();
    return TodoUseCase(todoRepository);
  }

  TodoChangeNotifier provideTodoChangeNotifier() {
    final TodoUseCase todoUseCase = provideTodoUseCase();
    return TodoChangeNotifier(todoUseCase);
  }
}
