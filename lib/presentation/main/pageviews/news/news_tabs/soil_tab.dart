import 'package:flutter/material.dart';

class SoilTabView extends StatelessWidget {
  final List data;
  const SoilTabView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Soil news'));
  }
}
