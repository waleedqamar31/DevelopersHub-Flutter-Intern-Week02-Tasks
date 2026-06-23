import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'todo_model.dart';

class TodoService {
  TodoService._();

  static final TodoService instance = TodoService._();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const String _todosKey = 'todos';

  /// Returns all todos
  List<TodoModel> getTodos() {
    final jsonString = _prefs.getString(_todosKey);

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList.map((json) => TodoModel.fromJson(json)).toList();
  }

  /// Adds a new todo
  Future<void> addTodo(TodoModel todo) async {
    final todos = getTodos();

    todos.add(todo);

    final jsonString = jsonEncode(todos.map((todo) => todo.toJson()).toList());

    await _prefs.setString(_todosKey, jsonString);
  }
}
