import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import '../components/movie_tile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Column(
          children: [
            Text('Result', style: kAppBarTitleStyle),
            Text('for "Search word"',
                style: GoogleFonts.inter(fontSize: 14, color: Colors.grey)),
          ],
        ),
        centerTitle: true,
        elevation: 0,
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
                child: Icon(
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
