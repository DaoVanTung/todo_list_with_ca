class TodoEntity {
  int id;
  String title;
  bool isCompleted;

  TodoEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  TodoEntity copyWith({
    int? id,
    String? title,
    bool? isCompleted,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
