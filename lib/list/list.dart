import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tassya/model/TodoEntity.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key key, this.todoList}) : super(key: key);
  final List<TodoEntity> todoList;

  @override
  State<StatefulWidget> createState() {
    return _TotoListState(todoList);
  }
}

class _TotoListState extends State<TodoList> {
  final List<TodoEntity> todoList;

  _TotoListState(this.todoList);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan[50],
        child: ListView.builder(
            itemCount: todoList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      todoList[index].text,
                      style: TextStyle(fontSize: 18.0),
                      maxLines: 2,
                    ),
                    Checkbox(
                        value: false,
                        onChanged: (bool isChecked) {
                          setState(() {});
                        })
                  ],
                ),
              );
            }));
  }
}
