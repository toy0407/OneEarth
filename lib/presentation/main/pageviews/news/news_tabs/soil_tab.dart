import 'package:flutter/material.dart';

class SoilTabView extends StatefulWidget {
  const SoilTabView({Key? key}) : super(key: key);

  @override
  State<SoilTabView> createState() => _SoilTabViewState();
}

class _SoilTabViewState extends State<SoilTabView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Soil news'),
    );
  }
}
