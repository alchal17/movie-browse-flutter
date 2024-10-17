import 'package:flutter/material.dart';
import 'package:movie_browse/models/movie.dart';
import 'package:movie_browse/views/screens/custom_routes.dart';
import 'package:movie_browse/views/screens/movie_info.dart';

class MovieCard extends StatefulWidget {
  final Movie _movie;

  const MovieCard({super.key, required Movie movie}) : _movie = movie;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            CustomRoutes.movieInfoRoute(MovieInfo(movie: widget._movie), 500));
      },
      child: FadeTransition(
        opacity: _animation,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // Ensure the image stretches
                children: [
                  Expanded(
                    child: Hero(
                      tag: "poster-${widget._movie.id}",
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${widget._movie.posterPath}",
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : const Center(
                                    child: CircularProgressIndicator(
                                    backgroundColor: Colors.grey,
                                  ));
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      maxLines: 2,
                      widget._movie.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned widget for rating in top left corner
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget._movie.voteAverage.toStringAsFixed(1),
                      // Display the movie rating
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
