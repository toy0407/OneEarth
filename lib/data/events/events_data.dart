import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class EventsRepository {
  Future<List<EventsData>> getData(String type) async {
    // Emulate network delay
    return await Future.delayed(const Duration(seconds: 0)).then((_) async {
      switch (type) {
        case "events_data":
          List<EventsData> eventsData = await getEventsData();
          eventsData.sort((a, b) {
            return b.date.compareTo(a.date);
          });
          return eventsData;

        default:
          return [];
      }
    });
  }

  getEventsData() async {
    List<EventsData> _eventsData = [];

    await FirebaseFirestore.instance
        .collection('Events')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        String _title = (doc.data() as dynamic)['title'];
        String _description = (doc.data() as dynamic)['description'];
        String _url = (doc.data() as dynamic)['url'];
        String _image = (doc.data() as dynamic)['image'];
        DateTime _date = DateTime.parse((doc.data() as dynamic)['date']);

        _eventsData.add(EventsData(_title, _description, _url, _image, _date));
      });
    });

    return _eventsData;
  }
}

class EventsData {
  late String description;
  late String title;
  late String url;
  late String image;
  late DateTime date;

  EventsData(String title, String description, String url, String image,
      DateTime date) {
    this.title = title;
    this.description = description;
    this.url = url;
    this.image = image;
    this.date = date;
  }
}
