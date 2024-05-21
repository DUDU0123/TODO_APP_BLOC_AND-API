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

class TodoResponseState extends TodoListState {
  final String message;
  TodoResponseState({
    required this.message,
  });
}