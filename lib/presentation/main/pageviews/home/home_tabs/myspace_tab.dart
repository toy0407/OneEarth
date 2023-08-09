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
  late AirQualityInformation airQualityInformation;

  @override
  void initState() {
    super.initState();
    trivia = widget.data[0];
    // airQualityInformation = widget.data[1];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        quizWidget(),
        airQualityInformationWidget(),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Did you know?',
                style: getBoldStyle(color: ColorManager.black),
              ),
            ],
          ),
          const SizedBox(height: AppSize.s16),
          Text(trivia.getFact(),
              style: getMediumStyle(
                color: ColorManager.darkGrey,
              )),
        ]),
      ),
    );
  }

  Widget airQualityInformationWidget() {
    return Card(
      elevation: AppSize.s4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppMargin.m12),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Air Quality Information',
                style: getBoldStyle(color: ColorManager.black),
              ),
              IconButton(onPressed: null, icon: Icon(Icons.gps_fixed_rounded)),
            ],
          ),
          Text('AQI',
              style: getMediumStyle(
                color: ColorManager.darkGrey,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('CO',
                      style: getMediumStyle(
                        color: ColorManager.darkGrey,
                      )),
                  Text('NO',
                      style: getMediumStyle(
                        color: ColorManager.darkGrey,
                      )),
                  Text('NO2',
                      style: getMediumStyle(
                        color: ColorManager.darkGrey,
                      )),
                  Text('O3',
                      style: getMediumStyle(
                        color: ColorManager.darkGrey,
                      )),
                ],
              ),
              Column(
                children: [
                  Text('SO2',
                      style: getMediumStyle(
                        color: ColorManager.darkGrey,
                      )),
                  Text('PM 2.5',
                      style: getMediumStyle(
                        color: ColorManager.darkGrey,
                      )),
                  Text('PM10',
                      style: getMediumStyle(
                        color: ColorManager.darkGrey,
                      )),
                  Text('NH3',
                      style: getMediumStyle(
                        color: ColorManager.darkGrey,
                      )),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
