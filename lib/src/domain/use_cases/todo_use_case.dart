import '../entities/todo_entity.dart';
import '../repositories/todo_repository.dart';

// Định nghĩa các Business Logic
class TodoUseCase {
  final TodoRepository repository;
  TodoUseCase(this.repository) {
    getTodos = GetTodosUseCase(repository);
    addTodo = AddTodoUseCase(repository);
    updateTodo = UpdateTodoUseCase(repository);
    deleteTodo = DeleteTodoUseCase(repository);
  }

  late GetTodosUseCase getTodos;
  late AddTodoUseCase addTodo;
  late UpdateTodoUseCase updateTodo;
  late DeleteTodoUseCase deleteTodo;
}

class GetTodosUseCase {
  final TodoRepository repository;

  GetTodosUseCase(this.repository);

  Future<List<TodoEntity>> execute() async {
    return repository.getTodos();
  }
}

class AddTodoUseCase {
  final TodoRepository repository;

  AddTodoUseCase(this.repository);

  Future<void> execute(TodoEntity todo) async {
    return repository.addTodo(todo);
  }
}

class UpdateTodoUseCase {
  final TodoRepository repository;

  UpdateTodoUseCase(this.repository);

  Future<void> execute(TodoEntity todo) async {
    return repository.updateTodo(todo);
  }
}

class DeleteTodoUseCase {
  final TodoRepository repository;

  DeleteTodoUseCase(this.repository);

  Future<void> execute(int id) async {
    return repository.deleteTodo(id);
  }
}
