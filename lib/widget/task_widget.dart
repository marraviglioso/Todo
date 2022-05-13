import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo.dart';
import 'package:todo/widget/util_class.dart';

import '../model/todo.dart';
import 'edit_todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Slidable(
          startActionPane: ActionPane(motion: const DrawerMotion(), children: [
            SlidableAction(
              onPressed: (_) => deleteTask(context, todo),
              backgroundColor: Color.fromARGB(255, 240, 49, 35),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (_) => editTask(context, todo),
              backgroundColor: Color.fromARGB(255, 54, 156, 58),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ]),
          key: Key(todo.id),
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => Container(
        color: Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: todo.isdone,
              onChanged: (_) {
                final provider =
                    Provider.of<TodoProvider>(context, listen: false);
                final isdone = provider.toggleTaskStatus(todo);
                Utils.showSnackBar(
                    context, isdone ? 'Task completed!' : 'Incomplete...');
              },
              activeColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 23,
                    ),
                  ),
                  if (todo.description.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        todo.description,
                        style: const TextStyle(fontSize: 20, height: 1.5),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      );

  void deleteTask(BuildContext context, Todo todo) {
    final provider = Provider.of<TodoProvider>(context, listen: false);
    provider.removeTask(todo);
    Utils.showSnackBar(context, "deleted");
  }

  void editTask(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTaskPage(todo: todo),
        ),
      );
}
