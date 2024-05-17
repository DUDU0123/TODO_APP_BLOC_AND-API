import 'package:todo_app_bloc_api/data/models/todo_model.dart';
import 'package:todo_app_bloc_api/data/provider/todo_provider.dart';

abstract class ITodoRespository {
  Future<List<TodoModel>> getAllTodos();
  Future<int> addTodo({required TodoModel todoModel});
  Future<int> editTodo({required TodoModel todoModel});
  Future<int> deleteTodo({required String todoId});
}

class TodoRespository implements ITodoRespository {
  final TodoProvider todoProvider;
  TodoRespository({
    required this.todoProvider,
  });
  @override
  Future<List<TodoModel>> getAllTodos() {
    return todoProvider.getTodos();
  }

  @override
  Future<int> addTodo({required TodoModel todoModel}) {
    return todoProvider.addTodo(
      title: todoModel.todoTitle,
      description: todoModel.todoDescription,
    );
  }

  @override
  Future<int> deleteTodo({required String todoId}) {
    return todoProvider.deleteById(id: todoId);
  }

  @override
  Future<int> editTodo({required TodoModel todoModel}) async{
    if (todoModel.todoId != null) {
      return todoProvider.editTodo(
        id: todoModel.todoId!,
        title: todoModel.todoTitle,
        description: todoModel.todoDescription,
      );
    }
    return 0;
  }
}
