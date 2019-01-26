import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tassya/list/list.dart';
import 'package:tassya/model/TodoEntity.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  final List<TodoEntity> todoList;

  _MyHomePageState() : todoList = List();

  @override
  Widget build(BuildContext context) {
    var field = TodoTextField();
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: _createTodoList(todoList),
      ),
      floatingActionButton: Padding(
          padding: EdgeInsets.all(16.0),
          child: _getFloatingActionButton(onPressed: () {
            setState(() {
              todoList.add(TodoEntity(DateTime.now().toString()));
            });
          })),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  static void _showSnackbar() {
    const String text = "TODO have been added";
    _scaffoldKey.currentState.showSnackBar(
      const SnackBar(content: Text(text)),
    );
  }

  static Widget _getFloatingActionButton({onPressed}) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add, semanticLabel: 'Action'),
      backgroundColor: Colors.orange,
    );
  }

  Widget _createTodoList(List<TodoEntity> todoList) {
    return TodoList(
      todoList: todoList,
    );
  }
}

class TodoTextField extends StatefulWidget {
  final _TodoTextFieldState state = _TodoTextFieldState();

  @override
  State<StatefulWidget> createState() => state;
}

class _TodoTextFieldState extends State<TodoTextField> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String text) {
        this.text = text;
      },
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration: InputDecoration.collapsed(hintText: 'Enter your TODO...'),
    );
  }
}
