// Đây là nơi bạn sẽ gọi API hoặc truy vấn cơ sở dữ liệu
// Tại sao lại cần có data source?
// Giả sử csdl Todo đang là SQL, tuy nhiên sau này ta muốn chuyển sang NoSQL
// Thì ta chỉ cần thay thế lớp Data Source mà không thay đổi bất kỳ lớp nào trong ứng dụng
// Trong Data Source có thể bổ sung thêm 2 thư mục `local` và `remote`
// Nhằm tách các dữ liệu được lấy từ local (localstore, sql lite) hay remote (api, firebase, ...)
import 'package:todo_list/src/data/model/todo_model.dart';

class TodoDataSource {
  // Mock data
  final List<TodoModel> _todos = [
    TodoModel(id: 1, title: 'Task 1', isCompleted: false),
    TodoModel(id: 2, title: 'Task 2', isCompleted: false),
    TodoModel(id: 3, title: 'Task 3', isCompleted: false),
  ];

  List<TodoModel> getTodos() {
    return _todos;
  }

  void addTodo(TodoModel todo) {
    _todos.add(todo);
  }

  void updateTodo(TodoModel todo) {
    int index = _todos.indexWhere((element) => element.id == todo.id);
    _todos[index] = todo;
  }

  void deleteTodo(int id) {
    _todos.removeWhere((element) => element.id == id);
  }
}
