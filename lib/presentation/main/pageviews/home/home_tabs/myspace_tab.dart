import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MySpaceTab extends StatefulWidget {
  const MySpaceTab({Key? key}) : super(key: key);

  @override
  State<MySpaceTab> createState() => _MySpaceTabState();
}

Map<String, String> get headers => {
      'X-RapidAPI-Key': '4b93e04aaemsh92adcd7a4c049e3p17e838jsn5531c1c97a6a',
      'X-RapidAPI-Host': 'webknox-trivia-knowledge-facts-v1.p.rapidapi.com',
    };

// final queryParameters = {'topic': 'dog'};

// Future<void> getFacts() async {
//   final uri = Uri.https('https://api.api-ninjas.com', '/v1/facts');

//   final response = await http.get(uri);

//   print(response.body);
// }

class _MySpaceTabState extends State<MySpaceTab> {
  @override
  Widget build(BuildContext context) {
    // getFacts();
    return Center(child: Text('My Spaces'));
  }
}
