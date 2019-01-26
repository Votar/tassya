class TodoEntity {
  final String text;
  final String createdAt;
  final bool isChecked;

  TodoEntity(this.text, {this.isChecked = false})
      : createdAt = DateTime.now().toString();

  TodoEntity.copyInverse(TodoEntity old)
      : this.text = old.text,
        this.isChecked = !old.isChecked,
        this.createdAt = old.createdAt;
}
