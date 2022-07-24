import 'package:flutter/material.dart';
import 'package:one_earth/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

/**
 * class Trivia
 * class AQI
 * class Graph
 * 
 * Trivia trivia = <- trivia
 * AQI aqi = <- aqi
 * 
 * 
 */
// List<Dynamic> data = [trivia];