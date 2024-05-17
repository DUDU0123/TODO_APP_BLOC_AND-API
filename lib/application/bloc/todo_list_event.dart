part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListEvent {}

class FetchedAllTodosEvent extends TodoListEvent{}

class AddTodoEvent extends TodoListEvent {
  final TodoModel todoModel;
  AddTodoEvent({
    required this.todoModel,
  });
}

class EditTodoEvent extends TodoListEvent {
  final TodoModel todoModel;
  EditTodoEvent({
    required this.todoModel,
  });
}

class DeleteTodoEvent extends TodoListEvent {
  final String todoId;
  DeleteTodoEvent({
    required this.todoId,
  });
}