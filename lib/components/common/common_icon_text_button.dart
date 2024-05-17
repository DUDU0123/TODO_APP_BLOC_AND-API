import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_bloc_api/components/common/text_widget_common.dart';
import 'package:todo_app_bloc_api/constants/colors.dart';

class CommonIconTextButton extends StatelessWidget {
  const CommonIconTextButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    required this.buttonTextColor,
    required this.buttonHeight,
    required this.buttonTextSize,
    required this.buttonHorizontalPadding,
    required this.buttonTextFont,
    required this.iconName,
    this.width,
    this.onTap,
    this.borderRadius,
  });
  final Color buttonColor;
  final String buttonText;
  final Color buttonTextColor;
  final double buttonHeight;
  final double buttonTextSize;
  final double buttonHorizontalPadding;
  final FontWeight buttonTextFont;
  final IconData iconName;
  final double? width;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonHeight.h,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: buttonHorizontalPadding.w),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: borderRadius ?? BorderRadius.circular(10.sp),
          boxShadow: [
            boxShadow,
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconName,
              ),
              TextWidgetCommon(
                text: buttonText,
                textColor: buttonTextColor,
                fontSize: buttonTextSize.sp,
                fontWeight: buttonTextFont,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
