import 'package:flutter/material.dart';
import 'package:one_earth/data/home/home_data.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';

class MySpaceTabView extends StatefulWidget {
  final List data;
  const MySpaceTabView({Key? key, required this.data}) : super(key: key);

  @override
  State<MySpaceTabView> createState() => _MySpaceTabViewState();
}

class _MySpaceTabViewState extends State<MySpaceTabView> {
  late Trivia trivia;

  @override
  void initState() {
    super.initState();
    trivia = widget.data[0];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        quizWidget(),
      ],
    );
  }

  Widget quizWidget() {
    return Card(
      elevation: AppSize.s4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16))),
      child: Padding(
        padding: const EdgeInsets.all(AppMargin.m12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Did you know?',
              style: getBoldStyle(color: ColorManager.black),
            ),
          ]),
          const SizedBox(height: AppSize.s16),
          Text(trivia.getFact(),
              style: getMediumStyle(
                color: ColorManager.darkGrey,
              )),
        ]),
      ),
    );
  }
}
