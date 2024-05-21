import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_bloc_api/components/common/text_widget_common.dart';
import 'package:todo_app_bloc_api/constants/colors.dart';
import 'package:todo_app_bloc_api/constants/height_width.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    super.key,
    required this.text,
    required this.textType,
  });

  final String text, textType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context: context),
      margin: EdgeInsets.only(right: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextWidgetCommon(
            text: "Todo $textType:",
            textColor: kWhite,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          kHeight5,
          TextWidgetCommon(
            maxLines: 15,
            overflow: TextOverflow.ellipsis,
            text: text,
            textColor: kWhite,
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
