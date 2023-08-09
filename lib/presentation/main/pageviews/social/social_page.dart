import 'package:flutter/material.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Social excuted');
    return Center(
      child: Text(
        'Social Page is coming soon !',
        style: getMediumStyle(color: ColorManager.darkPrimary),
      ),
    );
  }
}
