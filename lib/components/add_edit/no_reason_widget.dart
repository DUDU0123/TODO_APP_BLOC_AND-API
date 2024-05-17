import 'package:flutter/material.dart';
import 'package:todo_app_bloc_api/components/common/text_widget_common.dart';

class NoReasonWidget extends StatelessWidget {
  const NoReasonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidgetCommon(
        text: "No Todos Added",
      ),
    );
  }
}
