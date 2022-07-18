import 'package:flutter/material.dart';

class LocalTabView extends StatefulWidget {
  const LocalTabView({Key? key}) : super(key: key);

  @override
  State<LocalTabView> createState() => _LocalTabViewState();
}

class _LocalTabViewState extends State<LocalTabView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Local news'),
    );
  }
}
