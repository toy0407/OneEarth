import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository {
  Future<List> getData(String type) async {
    // Emulate network delay
    return await Future.delayed(const Duration(seconds: 0)).then((_) async {
      switch (type) {
        case "leaderboard":
          List leaderBoardData = [];
          return leaderBoardData;

        case "my_space":
          List allMySpaceData = [];
          Trivia trivia = Trivia();
          await trivia.getTrivia();
          allMySpaceData.add(trivia);
          return allMySpaceData;

        case "my_activities":
          List myActivitiesData = [];
          return myActivitiesData;

        default:
          return [];
      }
    });
  }
}

class Trivia {
  late String _fact = '';

  Trivia();

  String getFact() {
    return _fact;
  }

  getTrivia() async {
    int totalTrivia = 1;
    await FirebaseFirestore.instance
        .collection('Trivia')
        .get()
        .then((value) => totalTrivia = value.size);
    int randomTriviaId = Random().nextInt(totalTrivia) + 1;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('Trivia');

    QuerySnapshot querySnapshot = await _collectionRef
        .where('id', isEqualTo: randomTriviaId)
        .limit(1)
        .get();

    final triviaData = querySnapshot.docs.map((doc) => doc.data()).toList();

    _fact = ((triviaData[0] as dynamic)['fact']);
  }
}
