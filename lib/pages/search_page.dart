import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/services/networking.dart';
import '../components/movie_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchTextController = TextEditingController();
  List searchedMovies = [];

  Future startSearching({required String value}) async {
    List searchedMoviesResult = [];
    NetworkHepler networkHepler = NetworkHepler();
    try {
      searchedMoviesResult =
          await networkHepler.searchMovies(searchWord: value);
    } catch (e) {
      snackBarMessage(message: 'Error searching movies');
    }

    setState(() {
      searchedMovies = searchedMoviesResult;
    });
  }

  snackBarMessage({required String message}) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
            height: 40,
            color: const Color(0xFFF5F0E8),
            child: Center(child: Text(message))),
      ),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Search movies', style: kAppBarTitleStyle),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onSubmitted: (String value) {
                startSearching(value: value);
              },
              controller: _searchTextController,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                filled: true,
                fillColor: kSecondaryColor1,
                hintText: 'Search movies',
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: searchedMovies.length,
                itemBuilder: (context, index) {
                  return MovieTile(
                      index: index, selectedMovie: searchedMovies[index]);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
