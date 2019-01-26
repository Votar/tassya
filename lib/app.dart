import 'package:flutter/material.dart';
import 'package:tassya/bloc/ApplicationStateProvider.dart';
import 'package:tassya/main/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApplicationStateProvider(child: MyHomePage()),
    );
  }
}
