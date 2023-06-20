import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({required this.index, Key? key}) : super(key: key);
  final index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 160,
        color: Colors.transparent,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/cross.jpg')),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text('Movie Title',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Catagory1, Catagory2',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SubtitleContainer(child: Text('2019')),
                      SubtitleContainer(child: Text('Age group')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SubtitleContainer(child: Text('Rating')),
                      SubtitleContainer(child: Text('Length')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubtitleContainer extends StatelessWidget {
  const SubtitleContainer({
    required this.child,
    super.key,
  });
  final child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Color(0XFF262A34),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
