import 'package:cloud_firestore/cloud_firestore.dart';

class TutorialRepository {
  Future<List> getData(String type) async {
    // Emulate network delay
    return await Future.delayed(const Duration(seconds: 0)).then((_) async {
      switch (type) {
        case "tutorial_data":
          List tutorialData = await getTutorialData();
          return tutorialData;

        default:
          return [];
      }
    });
  }

  getTutorialData() async {
    var tutorialData = [];

    await FirebaseFirestore.instance
        .collection('Tutorials')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        tutorialData.add(doc.data());
      });
    });

    return tutorialData;
  }
}
