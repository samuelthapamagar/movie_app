import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/pages/search_page.dart';
import '../components/movie_tile.dart';
import '../components/navigator.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({required this.movieList, required this.catagory, Key? key})
      : super(key: key);

  final List movieList;
  final String catagory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(catagory, style: kAppBarTitleStyle),
        centerTitle: true,
        elevation: 2,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                // margin: EdgeInsets.all(5.0),
                color: kSecondaryColor1,
                height: 20,
                width: 20,
                child: const Icon(
                  Icons.arrow_back,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
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
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  return MovieTile(
                      index: index, selectedMovie: movieList[index]);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
