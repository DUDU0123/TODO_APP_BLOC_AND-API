import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc_api/application/bloc/todo_list_bloc.dart';
import 'package:todo_app_bloc_api/components/common/text_widget_common.dart';
import 'package:todo_app_bloc_api/constants/colors.dart';
import 'package:todo_app_bloc_api/data/models/todo_model.dart';
import 'package:todo_app_bloc_api/enums/enums.dart';
import 'package:todo_app_bloc_api/presentation/add_or_edit_todo/add_or_edit_todo_page.dart';

class ListTileButtonsWidget extends StatelessWidget {
  const ListTileButtonsWidget({
    super.key, required this.todoModel,
  });
  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddOrEditTodoPage(
                  todoModel: todoModel,
                  pageType: PageType.editTodo,
                ),
              ),
            );
          },
          icon: Icon(
            Icons.edit,
            color: kWhite,
          ),
        ),
        IconButton(
          onPressed: () {
            //id
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const TextWidgetCommon(
                  text: "Do you want to delete this todo?",
                ),
                title: const TextWidgetCommon(text: "Delete"),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kWhite),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: TextWidgetCommon(
                      text: "Cancel",
                      textColor: kBlack,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kRed),
                    onPressed: () {
                      Navigator.pop(context);
                      todoModel.todoId != null
                          ? context.read<TodoListBloc>().add(
                                DeleteTodoEvent(
                                  todoId: todoModel.todoId!,
                                ),
                              )
                          : null;
    
                      context
                          .read<TodoListBloc>()
                          .add(FetchedAllTodosEvent());
                    },
                    child: TextWidgetCommon(
                      text: "Delete",
                      textColor: kWhite,
                    ),
                  ),
                ],
              ),
            );
          },
          icon: Icon(
            Icons.delete_outline,
            color: kWhite,
          ),
        ),
      ],
    );
  }
}

