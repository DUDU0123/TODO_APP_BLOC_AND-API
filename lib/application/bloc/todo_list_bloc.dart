import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app_bloc_api/data/models/todo_model.dart';
import 'package:todo_app_bloc_api/data/repository/todo_repository.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final TodoRespository todoRespository;
  TodoListBloc(
    this.todoRespository,
  ) : super(TodoListInitial()) {
    on<TodoListEvent>(getAllTodosEvent);
    on<AddTodoEvent>(addTodoEvent);
    on<EditTodoEvent>(editTodoEvent);
    on<DeleteTodoEvent>(deleteTodoEvent);
  }

  Future<FutureOr<void>> getAllTodosEvent(
      TodoListEvent event, Emitter<TodoListState> emit) async {
    emit(TodoLoadingState());
    try {
      await Future.delayed(const Duration(milliseconds: 3200));
      final todoList = await todoRespository.getAllTodos();
      emit(
        TodoSuccessState(
          todoList: todoList,
        ),
      );
    } catch (e) {
      emit(
        TodoErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<FutureOr<void>> addTodoEvent(
      AddTodoEvent event, Emitter<TodoListState> emit) async {
    try {
      final statusCode =
          await todoRespository.addTodo(todoModel: event.todoModel);

      if (statusCode == 201) {
        emit(AddTodoState(message: "Successfully Added"));
      } else {
        emit(TodoErrorState(errorMessage: "Unable to add todo"));
      }
    } catch (e) {
      emit(TodoErrorState(errorMessage: "Unexpected Error Occured"));
    }
  }

  Future<FutureOr<void>> editTodoEvent(
      EditTodoEvent event, Emitter<TodoListState> emit) async {
    try {
      final statusCode =
          await todoRespository.editTodo(todoModel: event.todoModel);

      if (statusCode == 200) {
        emit(EditTodoState(message: 'Edited Successfully'));
      } else {
        emit(TodoErrorState(errorMessage: "Unable to edit todo"));
      }
    } catch (e) {
      emit(TodoErrorState(errorMessage: "Unexpected Error Occured"));
    }
  }

  Future<FutureOr<void>> deleteTodoEvent(
      DeleteTodoEvent event, Emitter<TodoListState> emit) async {
    try {
      final statusCode = await todoRespository.deleteTodo(todoId: event.todoId);
      if (statusCode == 200) {
        emit(DeleteTodoState(message: 'Deleted Successfully'));
      } else {
        emit(TodoErrorState(errorMessage: "Unable to delete todo"));
      }
    } catch (e) {
      emit(TodoErrorState(errorMessage: "Unexpected error"));
    }
  }
}
