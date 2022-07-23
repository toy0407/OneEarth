import 'package:flutter/material.dart';

class MySpaceTabView extends StatelessWidget {
  final String text;
  const MySpaceTabView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
      ),
    );
  }
}
