import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsRepository {
  Future<List> getData(String type) async {
    // Emulate network delay
    return await Future.delayed(const Duration(seconds: 0)).then((_) async {
      switch (type) {
        case "localNews":
          List leaderBoardData = [];
          return leaderBoardData;

        case "energyNews":
          List allMySpaceData = [];
          return allMySpaceData;

        case "waterNews":
          List myActivitiesData = [];
          return myActivitiesData;

        case "soilNews":
          List myActivitiesData = [];
          return myActivitiesData;

        default:
          return [];
      }
    });
  }
}
