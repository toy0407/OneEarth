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
  late String _question = '';
  late int _answer = -1;
  late List<String> _options = [];

  Trivia();

  String getQuestion() {
    return _question;
  }

  int getAnswer() {
    return _answer;
  }

  List<String> getOptions() {
    return _options;
  }

  getTrivia() async {
    int totalTrivia = 1;
    await FirebaseFirestore.instance
        .collection('Trivia')
        .get()
        .then((value) => totalTrivia = value.size);
    print(totalTrivia);
    int randomTriviaId = Random().nextInt(totalTrivia) + 1;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('Trivia');

    QuerySnapshot querySnapshot = await _collectionRef
        .where('id', isEqualTo: randomTriviaId)
        .limit(1)
        .get();

    final triviaData = querySnapshot.docs.map((doc) => doc.data()).toList();

    _question = ((triviaData[0] as dynamic)['question']);
    _answer = ((triviaData[0] as dynamic)['answer']);
    _options = List<String>.from(((triviaData[0] as dynamic)['options']));
  }
}
