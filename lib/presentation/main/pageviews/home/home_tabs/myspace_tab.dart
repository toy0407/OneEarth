import 'package:flutter/material.dart';
import 'package:one_earth/data/home/home_data.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';

class MySpaceTabView extends StatelessWidget {
  final List data;
  late Trivia trivia;
  MySpaceTabView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trivia = data[0];
    return Column(
      children: [
        QuizWidget(),
      ],
    );
  }

  Widget QuizWidget() {
    return Card(
      color: ColorManager.grey,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s8),
        child: Column(children: [
          Text(trivia.getQuestion()),
          Text(trivia.getAnswer().toString()),
          Text(trivia.getOptions().toString())
        ]),
      ),
    );
  }
}
