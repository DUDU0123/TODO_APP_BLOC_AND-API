part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListState {}

final class TodoListInitial extends TodoListState {}

class TodoLoadingState extends TodoListState{}
class TodoSuccessState extends TodoListState {
  final List<TodoModel> todoList;
  TodoSuccessState({
    required this.todoList,
  });
}
class TodoErrorState extends TodoListState {
  final String errorMessage;
  TodoErrorState({
    required this.errorMessage,
  });
}

class AddTodoState extends TodoListState {
  final String message;
  AddTodoState({
    required this.message,
  });
}

class EditTodoState extends TodoListState {
  final String message;
  EditTodoState({
    required this.message,
  });
}

class DeleteTodoState extends TodoListState {
  final String message;
  DeleteTodoState({
    required this.message,
  });
}
