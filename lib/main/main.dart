import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  final String title;
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  _MyHomePageState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Material(
          child:
              Padding(padding: EdgeInsets.all(16.0), child: TodoTextField())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSnackbar();
        },
        child: Icon(Icons.add, semanticLabel: 'Action'),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  static void _showSnackbar() {
    const String text =
        "When the Scaffold's floating action button location changes, "
        'the floating action button animates to its new position.'
        'The BottomAppBar adapts its shape appropriately.';
    _scaffoldKey.currentState.showSnackBar(
      const SnackBar(content: Text(text)),
    );
  }
}

class TodoTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TotoTextFieldState();
}

class _TotoTextFieldState extends State<TodoTextField> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration: InputDecoration.collapsed(hintText: 'Enter your TODO...'),
    );
  }
}
