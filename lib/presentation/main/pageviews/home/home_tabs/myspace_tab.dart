import 'package:flutter/material.dart';
import 'package:one_earth/data/home/home_data.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';

class MySpaceTabView extends StatelessWidget {
  final List data;
  late Trivia trivia;
  MySpaceTabView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trivia = data[0];
    return ListView(
      children: [
        QuizWidget(),
      ],
    );
  }

  Widget QuizWidget() {
    return Card(
      elevation: AppSize.s4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16))),
      child: Padding(
        padding: const EdgeInsets.all(AppMargin.m12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Did you know?',
              style: getBoldStyle(color: ColorManager.black),
            ),
          ]),
          SizedBox(height: AppSize.s16),
          Text(trivia.getQuestion(),
              style: getBoldStyle(
                color: ColorManager.darkGrey,
              )),
          SizedBox(height: AppSize.s12),
          ListView.separated(
              shrinkWrap: true,
              itemCount: trivia.getOptions().length,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: ((ctx, index) => const SizedBox(height: 12)),
              itemBuilder: (ctx, index) {
                return OutlinedButton(
                  onPressed: () => print('object'),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s16)))),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Text(
                      trivia.getOptions()[index],
                      style: getMediumStyle(color: ColorManager.darkGrey),
                    ),
                  ),
                );
              })
        ]),
      ),
    );
  }
}
