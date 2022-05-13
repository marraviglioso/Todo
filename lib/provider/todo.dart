import 'package:flutter/widgets.dart';

import '../model/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos.where((todo) => todo.isdone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isdone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTask(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTaskStatus(Todo todo) {
    todo.isdone = !todo.isdone;
    notifyListeners();
    return todo.isdone;
  }

  void updateTask(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
