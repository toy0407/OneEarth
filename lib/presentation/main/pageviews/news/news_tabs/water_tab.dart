import 'package:flutter/material.dart';

class WaterTabView extends StatelessWidget {
  final List data;
  const WaterTabView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Water news'));
  }
}
