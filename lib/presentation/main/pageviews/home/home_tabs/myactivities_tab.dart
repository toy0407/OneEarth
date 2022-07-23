import 'package:flutter/material.dart';

class MyActivitiesTabView extends StatelessWidget {
  final String text;
  const MyActivitiesTabView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
      ),
    );
  }
}
