import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_browse/views/elements/movies_table.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie Browse",
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 64, 64, 64),
          appBarTheme:
              const AppBarTheme(color: Color.fromARGB(255, 64, 64, 64))),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          elevation: 8,
          shadowColor: Colors.white,
          title: Center(
            child: Text(
              'Popular movies',
              style: GoogleFonts.openSans(
                  textStyle:
                      const TextStyle(fontSize: 25, color: Colors.white)),
            ),
          ),
        ),
        body: const MoviesTable(),
      ),
    );
  }
}
