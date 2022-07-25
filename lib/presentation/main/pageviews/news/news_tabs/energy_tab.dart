import 'package:flutter/material.dart';

class EnergyTabView extends StatelessWidget {
  final List data;
  const EnergyTabView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Energy news'));
  }
}
