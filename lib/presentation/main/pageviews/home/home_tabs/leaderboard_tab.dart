import 'package:flutter/material.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';

Widget LeaderboardTabView() {
  return Center(
      child: Text('Leaderboard is coming soon !',
          style: getRegularStyle(
            fontSize: AppSize.s16,
            color: ColorManager.grey,
          )));
}
