import 'package:flutter/material.dart';
import 'package:movie_app/pages/search_page.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie app for interview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        // colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF152238)),
        // useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
