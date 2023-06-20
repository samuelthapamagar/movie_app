import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/movie_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('All Movies'),
        centerTitle: true,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(
              Icons.search_rounded,
              size: 30,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return MovieTile(index: index);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
