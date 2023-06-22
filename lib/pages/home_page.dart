import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/components/navigator.dart';
import 'package:movie_app/components/movie_poster_builder.dart';
import 'package:movie_app/pages/search_page.dart';
import 'package:movie_app/services/networking.dart';

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
`
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

    print(trendingMovies);
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
                      itemCount: trendingMovies.length,
                      itemBuilder: (context, index) => MoviePosterBuilder(
                          index: index, movieList: trendingMovies)),
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
                      itemCount: series.length,
                      itemBuilder: (context, index) =>
                          MoviePosterBuilder(index: index, movieList: series)),
                ),
                SizedBox(height: 20),
                Text('Top Rated',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: topRated.length,
                      itemBuilder: (context, index) => MoviePosterBuilder(
                          index: index, movieList: topRated)),
                ),
                SizedBox(height: 20),
                Text('Upcoming',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  // color: Colors.red,
                  // width: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: upcoming.length,
                      itemBuilder: (context, index) => MoviePosterBuilder(
                            index: index,
                            movieList: upcoming,
                          )),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
