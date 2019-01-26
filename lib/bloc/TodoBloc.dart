import 'package:rxdart/rxdart.dart';
import 'package:tassya/model/TodoEntity.dart';

class TodoBloc {
  List<TodoEntity> _todoList = [];

  TodoBloc() {
    _availableTodoController.add(_todoList);
  }

  final _availableTodoController = BehaviorSubject<List<TodoEntity>>();
  final _onAddClickController = BehaviorSubject<void>();

  Stream<List<TodoEntity>> get todoListStream =>
      _availableTodoController.stream;

  Stream<Object> get onAddClickStream => _onAddClickController.stream;

  Function(Object) get onAddClicked => _onAddClickController.sink.add;

  void addTodo(String text) {
    if (text.isNotEmpty) {
      _todoList.add(TodoEntity((text)));
      _availableTodoController.add(_todoList);
    }
  }

  void checkedTodo(TodoEntity todo) {
    int index = _todoList.indexOf(todo);
    if (index != -1) {
      _todoList[index] = TodoEntity.copyInverse(todo);
      _availableTodoController.add(_todoList);
    } else
      throw Exception("$todo not found");
  }

  dispose() {
    _availableTodoController.close();
    _onAddClickController.close();
  }
}
