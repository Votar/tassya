class TodoEntity {
  final String text;
  final String createdAt;

  TodoEntity(this.text) : createdAt = DateTime.now().toString();
}
