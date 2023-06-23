import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/components/navigator.dart';
import 'package:movie_app/pages/search_page.dart';
import 'package:movie_app/services/networking.dart';
import '../components/movie_catagory_with_scroller.dart';
import '../components/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
    List trendingMoviesResult = [];
    List seriesResult = [];
    List topRatedResult = [];
    List upcomingResult = [];
    List nowPlayingResult = [];
    NetworkHepler networkHepler = NetworkHepler();

    try {
      trendingMoviesResult = await networkHepler.loadTrendingMovies();
    } catch (e) {
      snackBarMessage(message: 'Error loading trending movies.');
    }

    try {
      seriesResult = await networkHepler.loadSeries();
    } catch (e) {
      snackBarMessage(message: 'Error loading series.');
    }

    try {
      topRatedResult = await networkHepler.loadTopRated();
    } catch (e) {
      snackBarMessage(message: 'Error loading Top rated movies');
    }
    try {
      upcomingResult = await networkHepler.loadUpcoming();
    } catch (e) {
      snackBarMessage(message: 'Error loading Top upcoming movies');
    }

    try {
      nowPlayingResult = await networkHepler.loadNowPlaying();
    } catch (e) {
      snackBarMessage(message: 'Error loading now playing movies');
    }

    setState(() {
      trendingMovies = trendingMoviesResult;
      series = seriesResult;
      topRated = topRatedResult;
      upcoming = upcomingResult;
      nowPlaying = nowPlayingResult;
    });
  }

  //this if function is created to show the error message to the user through snackbar
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

        //Drawer is made for design only. It's functions can be added later.
        drawer: const NavBar(),
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
                MovieCatagoryWithScroller(
                    catagory: 'Now Playing', movieList: nowPlaying),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
