import 'package:flutter/widgets.dart';
import 'package:tassya/bloc/TodoBloc.dart';

class ApplicationStateProvider extends InheritedWidget {
  final TodoBloc _todoBloc = TodoBloc();

  //Take the Widget and push it to the InheritedWidget super class
  ApplicationStateProvider({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static TodoBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ApplicationStateProvider)
            as ApplicationStateProvider)
        ._todoBloc;
  }
}
