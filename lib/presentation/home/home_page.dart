import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_bloc_api/application/bloc/todo_list_bloc.dart';
import 'package:todo_app_bloc_api/components/add_edit/add_todo_navigate_widget.dart';
import 'package:todo_app_bloc_api/components/add_edit/list_tile_buttons_widget.dart';
import 'package:todo_app_bloc_api/components/add_edit/no_reason_widget.dart';
import 'package:todo_app_bloc_api/components/common/common_circular_progress_indicator_widget.dart';
import 'package:todo_app_bloc_api/components/common/common_list_empty_show_widget.dart';
import 'package:todo_app_bloc_api/components/common/snackbar.dart';
import 'package:todo_app_bloc_api/components/common/text_widget_common.dart';
import 'package:todo_app_bloc_api/constants/colors.dart';
import 'package:todo_app_bloc_api/constants/height_width.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidgetCommon(text: "Todo App"),
      ),
      body: BlocConsumer<TodoListBloc, TodoListState>(
        listener: (context, state) {
          if (state is AddTodoState) {
            context.read<TodoListBloc>().add(FetchedAllTodosEvent());
            snackBar(text: state.message, context: context);
          }
          if (state is TodoErrorState) {
            snackBar(text: state.errorMessage, context: context);
          }
          if (state is DeleteTodoState) {
            context.read<TodoListBloc>().add(FetchedAllTodosEvent());
            snackBar(text: state.message, context: context);
          }

          if (state is EditTodoState) {
            context.read<TodoListBloc>().add(FetchedAllTodosEvent());
            snackBar(text: state.message, context: context);
          }
        },
        builder: (context, state) {
          if (state is TodoLoadingState) {
            return const CommonCircularProgressIndicatorWidget();
          }

          if (state is TodoErrorState) {
            return Center(
              child: TextWidgetCommon(
                text: state.errorMessage,
              ),
            );
          }
          if (state is TodoSuccessState) {
            return Visibility(
              visible: state.todoList.isNotEmpty,
              replacement: const CommonListEmptyShowWidget(),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: kBlack,
                      child: TextWidgetCommon(text: (index + 1).toString()),
                    ),
                    tileColor: const Color.fromARGB(255, 70, 47, 123),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    onTap: () {},
                    title: TextWidgetCommon(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      text: state.todoList[index].todoTitle,
                      textColor: kWhite,
                    ),
                    trailing: ListTileButtonsWidget(todoModel: state.todoList[index],),
                  );
                },
                itemCount: state.todoList.length,
                separatorBuilder: (context, index) => kHeight10,
              ),
            );
          }
          return const NoReasonWidget();
        },
      ),
      floatingActionButton: const AddTodoNavigateWidget(),
    );
  }
}



