class TodoModel {
  String? todoId;
  final String todoTitle;
  final String todoDescription;
  TodoModel({
    this.todoId,
    required this.todoTitle,
    required this.todoDescription,
  });

  factory TodoModel.fromJson({required Map<String, dynamic> json}) {
    return TodoModel(
      todoId: json['_id'],
      todoTitle: json['title'],
      todoDescription: json['description'],
    );
  }

 Map<String,dynamic> toJson(){
    return {
      '_id':todoId,
      'title':todoTitle,
      'description': todoDescription,
    };
  }
}
