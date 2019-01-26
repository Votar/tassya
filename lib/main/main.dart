import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tassya/bloc/ApplicationStateProvider.dart';
import 'package:tassya/bloc/TodoBloc.dart';
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
    TodoBloc stateBloc = ApplicationStateProvider.of(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        bottom: false,
        child: TodoBlocWidget(),
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(
            bottom: 16.0,
          ),
          child: _getFloatingActionButton(onPressed: () {
            stateBloc.onAddClicked(Object());
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
}
