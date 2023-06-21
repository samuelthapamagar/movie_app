import 'package:flutter/material.dart';
import 'package:movie_app/components/subtitle_container.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
            ],
          ),
        ],
      ),
    ));
  }
}
