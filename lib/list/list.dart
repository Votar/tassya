import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tassya/model/TodoEntity.dart';

class TodoList extends StatefulWidget {
  final List<TodoEntity> todoList;
  final _TotoListState _state;

  TodoList({Key key, this.todoList})
      : _state = _TotoListState(todoList),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _state;
  }

  void onClick() {
    _state._handleTap();
  }
}

class _TotoListState extends State<TodoList> {
  final List<TodoEntity> todoList;
  final filed = TodoTextField();

  _handleTap() {
    setState(() {
      String text = filed.state.getText();
      if (text.isEmpty) {} else {
        todoList.add(TodoEntity(text));
        filed.state.clearField();
      }
    });
  }

  _TotoListState(this.todoList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todoList.length + 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0)
            return filed;
          else
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      todoList[index - 1].text,
                      style: TextStyle(fontSize: 18.0),
                      maxLines: 2,
                    ),
                    Checkbox(
                      value: false,
                      onChanged: (bool state) {
                        this.setState(() {
                          todoList.removeAt(index - 1);
                        });
                      },
                    )
                  ],
                ),
              ),
            );
        });
  }
}

class TodoTextField extends StatefulWidget {
  final _TodoTextFieldState state = _TodoTextFieldState();

  @override
  State<StatefulWidget> createState() => state;
}

class _TodoTextFieldState extends State<TodoTextField> {
  _TodoTextFieldState({this.initText = ""});

  final String initText;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: initText);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "I will ...",
          hintText: 'Enter your TODO...',
        ),
        maxLines: 3,
      ),
    );
  }

  void clearField() {
    _controller.clear();
  }

  String getText() => _controller.text;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
