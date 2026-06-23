import 'package:flutter/material.dart';
import 'package:week2/simpletodo/todo_model.dart';
import 'package:week2/simpletodo/todo_service.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoModel> todos = [];

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  Future<void> loadTodos() async {
    var todoL = await TodoService.instance.getTodos();

    setState(() {
      todos = todoL;
    });
  }

  Future<void> _addTodo() async {
    final titleController = TextEditingController();
    bool isCompleted = false;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Add Todo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CheckboxListTile(
                    title: const Text('Completed'),
                    value: isCompleted,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setDialogState(() {
                        isCompleted = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (titleController.text.trim().isEmpty) {
                      return;
                    }

                    await TodoService.instance.addTodo(
                      TodoModel(
                        title: titleController.text.trim(),
                        isCompleted: isCompleted,
                      ),
                    );

                    Navigator.pop(context);

                    await loadTodos();
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Todo App')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                todos[index].title,
                style: TextStyle(fontSize: 18, fontWeight: .w600),
              ),
              trailing: Icon(
                todos[index].isCompleted
                    ? Icons.check_circle
                    : Icons.circle_outlined,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
