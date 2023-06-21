import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 500,
                  width: double.maxFinite,
                  child: Image.asset('assets/images/cross.jpg',
                      fit: BoxFit.cover)),
              Row(
                children: [
                  RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back))
                ],
              ),
            ],
          ),
          Center(
            child: Text('This is movie details page.'),
          )
        ],
      ),
    ));
  }
}
