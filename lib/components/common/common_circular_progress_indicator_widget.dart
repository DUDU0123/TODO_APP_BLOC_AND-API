import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app_bloc_api/components/common/text_widget_common.dart';
import 'package:todo_app_bloc_api/constants/colors.dart';

class CommonCircularProgressIndicatorWidget extends StatelessWidget {
  const CommonCircularProgressIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100.h),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.h,
              child: Lottie.network(
                'https://lottie.host/40d81076-f17a-4627-a432-4a2d6d29086a/LOHjJOTnMS.json',
                alignment: Alignment.center,
              ),
            ),
            TextWidgetCommon(text: "Please Wait...", textColor: kWhite,fontSize: 20.sp,fontWeight: FontWeight.w500,),
          ],
        ),
      ),
    );
  }
}
