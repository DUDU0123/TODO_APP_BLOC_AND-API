import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CommonListEmptyShowWidget extends StatelessWidget {
  const CommonListEmptyShowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100.h,
        child: Lottie.network(
          'https://lottie.host/2307eae4-1146-4622-85ba-7db8ed212bfe/SoSlvfCQlM.json',
        ),
      ),
    );
  }
}
