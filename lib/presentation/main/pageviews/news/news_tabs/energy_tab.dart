import 'package:flutter/material.dart';

class EnergyTabView extends StatefulWidget {
  const EnergyTabView({Key? key}) : super(key: key);

  @override
  State<EnergyTabView> createState() => _EnergyTabViewState();
}

class _EnergyTabViewState extends State<EnergyTabView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Energy news'),
    );
  }
}
