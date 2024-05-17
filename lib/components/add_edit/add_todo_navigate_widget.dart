import 'package:flutter/material.dart';
import 'package:todo_app_bloc_api/components/common/text_widget_common.dart';
import 'package:todo_app_bloc_api/constants/colors.dart';
import 'package:todo_app_bloc_api/enums/enums.dart';
import 'package:todo_app_bloc_api/presentation/add_or_edit_todo/add_or_edit_todo_page.dart';

class AddTodoNavigateWidget extends StatelessWidget {
  const AddTodoNavigateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: kWhite,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddOrEditTodoPage(
              pageType: PageType.addTodo,
            ),
          ),
        );
      },
      label: TextWidgetCommon(
        text: "Add Todo",
        textColor: kBlack,
      ),
    );
  }
}
