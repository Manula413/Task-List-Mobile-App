class Task {
  final int? id;
  final String title;
  final String description;
  final String dueDate;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
  });

  // Convert Task object to a map for storing in the database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'due_date': dueDate,
    };
  }

  // Convert a map to a Task object
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: map['due_date'],
    );
  }
}
