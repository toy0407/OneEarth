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
          AirQualityInformation aqi = AirQualityInformation();
          await trivia.getTrivia();
          allMySpaceData.add(trivia);
          await aqi.getAirQualityInformation();
          allMySpaceData.add(aqi);
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

class AirQualityInformation {
  late double aqi, co, no, no2, o3, so2, pm2_5, pm10, nh3;
  late String place;
  double latitude = 0, longtitude = 0;

  getDataFromApi(double latitude, double longtitude) {
    /**
     * Create url from string
     * Fetch the data using the url
     * Reference: https://docs.flutter.dev/cookbook/networking/fetch-data
     */
  }

  getLocation() async {
    /**
     * Get latitude and longitude from Geolocator (Must use last location)
     * https://pub.dev/packages/geolocator
     */
  }

  getPlaceFromLL(double latitude, double longtitude) {
    /**
     * Get Name of the location from the givern latitude and longitude by GeoCoding package
     * https://pub.dev/packages/geocoding
     */
  }

  getAirQualityInformation() async {
    /**
     * getLocation() => store it into this.latitude and this.longitude 
     * getPlaceFromLL() => store place name into this.place
     * getLocation() => this.aqi, this.co, this.no, this.no2, this.o3, this.so2, this.pm2_5, this.pm10, this.nh3
     */
  }
}
