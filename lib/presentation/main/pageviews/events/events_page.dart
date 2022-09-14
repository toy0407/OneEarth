import 'package:flutter/material.dart';
import 'package:one_earth/data/events/events_data.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';

class EventsPage extends StatefulWidget {
  final List<EventsData>? data;
  const EventsPage({Key? key, this.data}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  void initState() {
    super.initState();
    print(widget.data![0].date);
    print(widget.data![1].date);
    print(widget.data![2].date);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Events Page is coming soon !',
        style: getMediumStyle(color: ColorManager.darkPrimary),
      ),
    );
  }
}
