import 'package:flutter/material.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';

class MyActivitiesTabView extends StatelessWidget {
  final List data;
  const MyActivitiesTabView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'My Activities is coming soon!',
        style: getMediumStyle(color: ColorManager.darkPrimary),
      ),
    );
  }
}
