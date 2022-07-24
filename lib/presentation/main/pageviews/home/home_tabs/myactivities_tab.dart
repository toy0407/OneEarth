import 'package:flutter/material.dart';

class MyActivitiesTabView extends StatelessWidget {
  final List data;
  const MyActivitiesTabView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        data.toString(),
      ),
    );
  }
}
