class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  late DateTime createdTime;

  late String title;

  late String id;

  late String description;

  late bool isdone;

  Todo({
    required this.createdTime,
    required this.title,
    required this.id,
    required this.description,
    this.isdone = false,
  });
}
