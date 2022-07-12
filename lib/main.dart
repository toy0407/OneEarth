import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/login/auth_repository.dart';
import 'package:one_earth/presentation/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "One Earth",
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
              create: (context) => AuthRepository()),
        ],
        child: const SplashScreen(),
      ),
    );
  }
}
