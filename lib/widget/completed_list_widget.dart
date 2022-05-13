import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widget/task_widget.dart';

import '../provider/todo.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = provider.todosCompleted;

    if (todos.isEmpty) {
      return const Center(
        child: Text(
          'No completed tasks.',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    } else {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => Container(
          height: 8,
        ),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return TodoWidget(todo: todo);
        },
      );
    }
  }
}
