// Sử dụng Transfer nhằm giảm phụ thuộc giữa tầng Data và Domain
// Chúng ta sẽ tạo Model để sử dụng trong tầng Data
// Và sử dụng Transfer để chuyển đổi Model trong tầng Data thành Entity trong tầng Domain
// Khi Entity trong Domain thay đổi, chúng ta chỉ cần cập nhật lại lớp Transfer của đối tượng tương ứng
// Nếu sử dụng Entity ở tầng Domain thì khi Entity thay đổi tầng Data sẽ phải cập nhật lại mọi chỗ sử dụng Entity

import '../../domain/entities/todo_entity.dart';
import '../model/todo_model.dart';

class TodoTransfer {
  TodoTransfer();

  static TodoEntity modelToEntity(TodoModel model) {
    return TodoEntity(
      id: model.id,
      title: model.title,
      isCompleted: model.isCompleted,
    );
  }

  static TodoModel entityToModel(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      isCompleted: entity.isCompleted,
    );
  }
}
