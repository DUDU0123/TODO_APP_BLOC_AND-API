import 'package:flutter/material.dart';
import 'package:todo_app_bloc_api/components/common/text_widget_common.dart';
import 'package:todo_app_bloc_api/constants/colors.dart';

void snackBar({
  required String text,
  required BuildContext context,
  Color? bgColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: TextWidgetCommon(
        text: text,
        textColor: kWhite,
      ),
      backgroundColor: bgColor ?? kBlack,
      duration: const Duration(seconds: 1),
    ),
  );
}
