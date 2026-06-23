import 'dart:convert';

class TodoModel {
  final String title;
  final bool isCompleted;

  TodoModel({required this.title, this.isCompleted = false});

  Map<String, dynamic> toJson() {
    return {'title': title, 'isCompleted': isCompleted};
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  @override
  String toString() => jsonEncode(toJson());
}
