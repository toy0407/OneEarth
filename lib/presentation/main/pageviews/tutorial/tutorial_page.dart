import 'package:flutter/material.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';

class TutorialPage extends StatefulWidget {
  final List? data;
  const TutorialPage({Key? key, this.data}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  void initState() {
    print((widget.data![0] as dynamic)['title']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tutorial Page is coming soon !',
        style: getMediumStyle(color: ColorManager.darkPrimary),
      ),
    );
  }
}
