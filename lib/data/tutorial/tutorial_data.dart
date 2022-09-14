import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class TutorialRepository {
  Future<List<TutorialData>> getData(String type) async {
    // Emulate network delay
    return await Future.delayed(const Duration(seconds: 0)).then((_) async {
      switch (type) {
        case "tutorial_data":
          List<TutorialData> tutorialData = await getTutorialData();
          return tutorialData;

        default:
          return [];
      }
    });
  }

  getTutorialData() async {
    List<TutorialData> _tutorialData = [];

    await FirebaseFirestore.instance
        .collection('Tutorials')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        String _title = (doc.data() as dynamic)['title'];
        String _description = (doc.data() as dynamic)['description'];
        String _url = (doc.data() as dynamic)['url'];
        String _image = getImage(_url);

        _tutorialData.add(TutorialData(_title, _description, _url, _image));
      });
    });

    return _tutorialData;
  }

  String getImage(String url) {
    //   final fileName = await VideoThumbnail.thumbnailFile(
    //   video: url,
    //   imageFormat: ImageFormat.WEBP,
    //   maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
    //   quality: 75,
    // );
    String id = url.substring(url.length - 11);
    String image = "https://img.youtube.com/vi/$id/0.jpg";
    return image;
  }
}

class TutorialData {
  late String description;
  late String title;
  late String url;
  late String image;

  TutorialData(String title, String description, String url, String image) {
    this.title = title;
    this.description = description;
    this.url = url;
    this.image = image;
  }
}
