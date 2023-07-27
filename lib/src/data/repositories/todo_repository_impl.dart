import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/todo_repository.dart';
import '../data_sources/todo_data_source.dart';
import '../transfers/todo_transfer.dart';

// Lớp này phụ thuộc vào TodoRepository ở tầng Domain
class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource todoDataSource;

  TodoRepositoryImpl(this.todoDataSource);

  @override
  Future<void> addTodo(TodoEntity todo) async {
    todoDataSource.addTodo(TodoTransfer.entityToModel(todo));
  }

  @override
  Future<void> deleteTodo(int id) async {
    todoDataSource.deleteTodo(id);
  }

  @override
  Future<List<TodoEntity>> getTodos() async {
    final models = todoDataSource.getTodos();
    return models.map((model) => TodoTransfer.modelToEntity(model)).toList();
  }

  @override
  Future<void> updateTodo(TodoEntity todo) async {
    todoDataSource.updateTodo(TodoTransfer.entityToModel(todo));
  }
}
