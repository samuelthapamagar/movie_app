import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import '../components/movie_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchTextController = TextEditingController();

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
            TextField(
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
