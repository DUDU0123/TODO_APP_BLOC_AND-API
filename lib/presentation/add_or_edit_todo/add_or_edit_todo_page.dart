import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_bloc_api/application/bloc/todo_list_bloc.dart';
import 'package:todo_app_bloc_api/components/common/common_textfield.dart';
import 'package:todo_app_bloc_api/components/common/snackbar.dart';
import 'package:todo_app_bloc_api/components/common/text_widget_common.dart';
import 'package:todo_app_bloc_api/constants/colors.dart';
import 'package:todo_app_bloc_api/constants/height_width.dart';
import 'package:todo_app_bloc_api/data/models/todo_model.dart';
import 'package:todo_app_bloc_api/enums/enums.dart';
class AddOrEditTodoPage extends StatefulWidget {
  const AddOrEditTodoPage({super.key, required this.pageType, this.todoModel});
  final PageType pageType;
  final TodoModel? todoModel;
  @override
  State<AddOrEditTodoPage> createState() => _AddOrEditTodoPageState();
}
class _AddOrEditTodoPageState extends State<AddOrEditTodoPage> {
  
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    if (widget.todoModel!=null && widget.pageType==PageType.editTodo) {
      titleController.text = widget.todoModel!.todoTitle;
      descriptionController.text = widget.todoModel!.todoDescription;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidgetCommon(
            text:
                widget.pageType == PageType.addTodo ? "Add Todo" : "Edit Todo"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          Column(
            children: [
              CommonTextField(
                controller: titleController,
                hintText: "Title",
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
            ],
          ),
          kHeight10,
          CommonTextField(
            controller: descriptionController,
            hintText: "Description",
            keyboardType: TextInputType.multiline,
            maxLines: 8,
          ),
          kHeight20,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.sp),
              ),
            ),
            onPressed: () {
              final title = titleController.text;
              final description = descriptionController.text;
              if (title.isEmpty || description.isEmpty) {
                snackBar(text: "Fill all fields", context: context);
              } else {
                TodoModel todoModel = TodoModel(
                  todoTitle: title,
                  todoDescription: description,
                );
                TodoModel? editedTodoModel = widget.todoModel?.copyWith(
                  todoDescription: description.isNotEmpty?description:widget.todoModel?.todoDescription,
                  todoTitle: title.isNotEmpty?title:widget.todoModel?.todoTitle,
                );
                widget.pageType == PageType.addTodo
                    ? context.read<TodoListBloc>().add(
                          AddTodoEvent(
                            todoModel: todoModel,
                          ),
                        )
                    :editedTodoModel!=null? context.read<TodoListBloc>().add(
                          EditTodoEvent(todoModel: editedTodoModel),
                        ):null;
                Navigator.pop(context);
                titleController.text = '';
                descriptionController.text = '';
              }
            },
            child: TextWidgetCommon(
              text: widget.pageType == PageType.addTodo ? "Add" : "Save",
              textColor: kBlack,
            ),
          ),
        ],
      ),
    );
  }
}
