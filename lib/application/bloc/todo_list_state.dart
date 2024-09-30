part of 'todo_list_bloc.dart';

@immutable
class TodoListState {
  final List<TodoModel>? todoList;
   final String? message;
  const TodoListState({
     this.todoList,
     this.message,
  });
  TodoListState copyWith({List<TodoModel>? todoList,String? message,}){
    return TodoListState(
      message: message??this.message,
      todoList: todoList??this.todoList,
    );
  }
}

final class TodoListInitial extends TodoListState {}

class TodoLoadingState extends TodoListState{}
class TodoErrorState extends TodoListState {
  final String errorMessage;
 const TodoErrorState({
    required this.errorMessage,
  });
}