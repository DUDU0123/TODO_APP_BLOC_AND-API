import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CommonCircularProgressIndicatorWidget extends StatelessWidget {
  const CommonCircularProgressIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150.h,
        child: Lottie.network(
          'https://lottie.host/40d81076-f17a-4627-a432-4a2d6d29086a/LOHjJOTnMS.json',
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
