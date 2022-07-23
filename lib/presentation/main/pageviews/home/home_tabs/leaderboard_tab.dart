import 'package:flutter/material.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';

class LeaderboardTabView extends StatelessWidget {
  final String text;
  const LeaderboardTabView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(text,
            style: getRegularStyle(
              fontSize: AppSize.s16,
              color: ColorManager.grey,
            )));
  }
}
