import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widget/todo_form.dart';

import '../model/todo.dart';
import '../provider/todo.dart';

class EditTaskPage extends StatefulWidget {
  final Todo todo;

  const EditTaskPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTaskPage> {
  late String title;
  late String description;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Edit'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TaskFormWidget(
              title: title,
              description: description,
              onchangedTitle: (title) => setState(
                () => this.title = title,
              ),
              onchangedDescription: (description) => setState(
                () => this.description = description,
              ),
              onsavedTodo: saveTask,
            ),
          ),
        ),
      );

  void saveTask() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      final provider = Provider.of<TodoProvider>(context, listen: false);
      provider.updateTask(widget.todo, title, description);
      Navigator.of(context).pop();
    }
  }
}
