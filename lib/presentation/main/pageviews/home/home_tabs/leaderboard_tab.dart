import 'package:flutter/material.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';

class LeaderboardTabView extends StatelessWidget {
  final List data;
  const LeaderboardTabView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Leaderboard is coming soon!',
            style: getMediumStyle(
              color: ColorManager.darkPrimary,
            )));
  }
}
