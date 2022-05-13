import 'package:flutter/material.dart';

class TaskFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onchangedTitle;
  final ValueChanged<String> onchangedDescription;
  final VoidCallback onsavedTodo;

  const TaskFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onchangedTitle,
    required this.onchangedDescription,
    required this.onsavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            buildDescription(),
            const SizedBox(height: 35),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onchangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: const InputDecoration(
            border: UnderlineInputBorder(), labelText: 'Title'),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 2,
        initialValue: description,
        onChanged: onchangedDescription,
        decoration: const InputDecoration(
            border: UnderlineInputBorder(), labelText: 'Description'),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onsavedTodo,
          child: const Text('Save'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
        ),
      );
}
