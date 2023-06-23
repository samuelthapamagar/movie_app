import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/components/navigator.dart';
import 'package:movie_app/components/movie_poster_builder.dart';
import 'package:movie_app/pages/search_page.dart';
import 'package:movie_app/services/networking.dart';

import '../components/movie_catagory_with_scroller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List series = [];
  List topRated = [];
  List upcoming = [];
  List nowPlaying = [];

  loadMovies() async {
    NetworkHepler networkHepler = NetworkHepler();
    List trendingMoviesResult = await networkHepler.loadTrendingMovies();
    List seriesResult = await networkHepler.loadSeries();
    List topRatedResult = await networkHepler.loadTopRated();
    List upcomingResult = await networkHepler.loadUpcoming();
    List nowPlayingResult = await networkHepler.loadNowPlaying();

    setState(() {
      trendingMovies = trendingMoviesResult;
      series = seriesResult;
      topRated = topRatedResult;
      upcoming = upcomingResult;
      nowPlaying = nowPlayingResult;
    });

    // print(trendingMovies);
    // print(series);
  }

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

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
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                child:
                    Image.asset('assets/images/parrot.jpg', fit: BoxFit.cover),
              ),
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                MovieCatagoryWithScroller(
                    catagory: 'Trending Now', movieList: trendingMovies),
                const SizedBox(height: 20),
                MovieCatagoryWithScroller(
                    catagory: 'Series', movieList: series),
                const SizedBox(height: 20),
                MovieCatagoryWithScroller(
                    catagory: 'Top Rated', movieList: topRated),
                const SizedBox(height: 20),
                MovieCatagoryWithScroller(
                    catagory: 'Upcoming', movieList: upcoming),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
