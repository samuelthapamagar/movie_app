import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/components/navigator.dart';
import 'package:movie_app/pages/movie_details_page.dart';
import 'package:movie_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          title: Text('All Movies', style: kAppBarTitleStyle),
          backgroundColor: kPrimaryColor,
          elevation: 0,
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                nextPage(context, const SearchPage());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    // margin: EdgeInsets.all(5.0),
                    color: kSecondaryColor1,
                    height: 20,
                    width: 40,
                    child: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30),
                Text('Trending Now',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  // color: Colors.red,
                  // width: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) =>
                          BuildMoviePoster(index: index)),
                ),
                SizedBox(height: 20),
                Text('Series',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  // color: Colors.red,
                  // width: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) =>
                          BuildMoviePoster(index: index)),
                ),
                SizedBox(height: 20),
                Text('Drama',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) =>
                          BuildMoviePoster(index: index)),
                ),
                SizedBox(height: 20),
                Text('Documentries',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  // color: Colors.red,
                  // width: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) =>
                          BuildMoviePoster(index: index)),
                ),
                SizedBox(height: 20),
                Center(child: Text('This is homepage')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildMoviePoster extends StatelessWidget {
  const BuildMoviePoster({
    required this.index,
    super.key,
  });
  final index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            child: Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/parrot.jpg',
              ),
              child: InkWell(
                onTap: () {
                  nextPage(context, MovieDetailsPage());
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
