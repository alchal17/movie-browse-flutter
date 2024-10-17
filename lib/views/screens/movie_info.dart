import 'package:flutter/material.dart';
import 'package:movie_browse/models/movie.dart';

class MovieInfo extends StatelessWidget {
  final Movie _movie;

  const MovieInfo({super.key, required Movie movie}) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            _movie.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.grey,
          child: const Icon(Icons.arrow_back_rounded)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Hero(
                  tag: "poster-${_movie.id}",
                  child: Material(
                    color: Colors.transparent,
                    elevation: 20,
                    child: Image.network(
                        "https://image.tmdb.org/t/p/w500${_movie.posterPath}"),
                  ),
                ),
              ),
              Text(
                _movie.overview,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
