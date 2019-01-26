import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tassya/bloc/ApplicationStateProvider.dart';
import 'package:tassya/bloc/TodoBloc.dart';
import 'package:tassya/model/TodoEntity.dart';

class TodoBlocWidget extends StatelessWidget {
  final filed = TodoTextField();

  _subscribeOnAddClick(TodoBloc bloc) async {
    try {
      await for (var value in bloc.onAddClickStream) {
        bloc.addTodo(filed.state._controller.text);
        filed.state._controller.clear();
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    TodoBloc stateBloc = ApplicationStateProvider.of(context);
    _subscribeOnAddClick(stateBloc);
    return StreamBuilder(
        stream: stateBloc.todoListStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          final todoList = (snapshot.data as List<TodoEntity>);
          if (todoList == null)
            return Container(
              width: 0.0,
              height: 0.0,
            );
          else {
            return ListView.builder(
                itemCount: todoList.length + 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0)
                    return filed;
                  else {
                    TodoEntity entity = todoList[index - 1];
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              entity.text,
                              style: TextStyle(fontSize: 18.0),
                              maxLines: 2,
                            ),
                            Checkbox(
                              value: entity.isChecked,
                              onChanged: (bool state) {
                                stateBloc.checkedTodo(todoList[index - 1]);
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  }
                });
          }
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
