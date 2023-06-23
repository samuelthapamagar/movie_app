import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 200,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo_1.jpg', scale: 1.5),
                const SizedBox(height: 5),
                Text(
                  'Movie App',
                  style: GoogleFonts.poppins(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: const ListTile(
              leading: Icon(Icons.camera),
              title: Text('Videos'),
            ),
          ),
          const Divider(),
          const InkWell(
            child: ListTile(
              leading: Icon(Icons.people),
              title: Text('About App'),
            ),
          ),
        ],
      ),
    );
  }
}
