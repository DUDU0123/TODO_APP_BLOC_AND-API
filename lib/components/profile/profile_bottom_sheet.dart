import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_bloc_api/components/common/text_widget_common.dart';
import 'package:todo_app_bloc_api/components/profile/profile_details_widget.dart';
import 'package:todo_app_bloc_api/constants/colors.dart';
import 'package:todo_app_bloc_api/constants/height_width.dart';
import 'package:todo_app_bloc_api/data/models/todo_model.dart';

Future<dynamic> profileBottomSheet(BuildContext context, TodoModel todoModel) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.only(left: 30.w),
        width: screenWidth(context: context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.sp),
            topLeft: Radius.circular(20.sp),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight50,
              TextWidgetCommon(
                text: "Todo Details",
                textColor: kWhite,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              kHeight15,
              ProfileDetailsWidget(
                text: todoModel.todoTitle,
                textType: 'title',
              ),
              kHeight30,
              ProfileDetailsWidget(
                text: todoModel.todoDescription,
                textType: 'description',
              ),
              kHeight20,
            ],
          ),
        ),
      );
    },
  );
}
