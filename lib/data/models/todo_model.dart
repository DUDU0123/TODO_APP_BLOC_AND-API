class TodoModel {
  String? todoId;
  final String todoTitle;
  final String todoDescription;
  bool? isCompleted;
  TodoModel({
    this.todoId,
    required this.todoTitle,
    required this.todoDescription,
    this.isCompleted,
  });

  factory TodoModel.fromJson({required Map<String, dynamic> json}) {
    return TodoModel(
      todoId: json['_id'],
      todoTitle: json['title'],
      todoDescription: json['description'],
      isCompleted: json['is_completed']
    );
  }

 Map<String,dynamic> toJson(){
    return {
      '_id':todoId,
      'title':todoTitle,
      'description': todoDescription,
      'is_completed': isCompleted,
    };
  }
  TodoModel copyWith({
    String? todoId,
    String? todoTitle,
    String? todoDescription,
    bool? isCompleted,
  }) {
    return TodoModel(
      todoId: todoId ?? this.todoId,
      todoTitle: todoTitle ?? this.todoTitle,
      todoDescription: todoDescription ?? this.todoDescription,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
