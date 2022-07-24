import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeRepository {

  late String question;
  late int answerIndex;
  late List<String> options;

  getTrivia() async {

    String _question = 'NULL';
    int _answer = -1;
    List<String> _options = [];
    int randomTriviaId = Random().nextInt(2) + 1;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('Trivia');
    QuerySnapshot querySnapshot = await _collectionRef.where('id', isEqualTo: randomTriviaId).limit(1).get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
    // triviaReference
    //     // .where('id', isEqualTo: randomTriviaId)
    //     // .limit(1)
    //     .then((snapshot) =>
    // {
    //   // print(snapshot.size);
    //   if (snapshot.size > 0)
    //     {
    //       snapshot.docs.forEach((element) {
    //         print(element);
    //         _question = element['question'];
    //         _answer = element['answer'];
    //         _options = element['options'];
    //       })
    //     }
    // });
    // debugPrint("Question $_question ; AnswerIndex $_answer ; options $_options");
  }

  Future<String> getData(String type) async {
    // Emulate network delay
    return await Future.delayed(const Duration(seconds: 2)).then((_) {
      switch (type) {
        case "leaderboard":
          return "leaderboard is coming !";

        case "my_space":
          print("hi");
          getTrivia();
          return "My Space";

        case "my_activities":
        default:
          return "My Activities is coming !";
      }
    });
  }
}

class Trivia {


  Trivia({required String question,
    required int answerIndex,
    required List<String> options});


}
