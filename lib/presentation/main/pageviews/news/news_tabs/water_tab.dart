import 'package:flutter/material.dart';

class WaterTabView extends StatefulWidget {
  const WaterTabView({Key? key}) : super(key: key);

  @override
  State<WaterTabView> createState() => _WaterTabViewState();
}

class _WaterTabViewState extends State<WaterTabView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Water news'),
    );
  }
}
