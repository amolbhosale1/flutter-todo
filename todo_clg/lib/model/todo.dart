
class Todo {
  String? text;
  bool done;
  DateTime? date;

  Todo({this.text, this.done = false, this.date});

  factory Todo.fromMap(map) {
    return Todo(
      text: map['text'],
      done: map['done'],
      date: map['date'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'done': done,
      'date': date,
    };
  }

 
}
