import 'package:flutter/cupertino.dart';
import 'package:movie_browse/di/injection_container.dart';
import 'package:movie_browse/services/pagination_service.dart';

import '../../models/movie.dart';
import 'movie_card.dart';

class MoviesTable extends StatefulWidget {
  const MoviesTable({super.key});

  @override
  State<MoviesTable> createState() => _MoviesTableState();
}

class _MoviesTableState extends State<MoviesTable> {
  var _currentPage = 1;

  var _isLoaded = false;

  List<Movie> _movies = List.empty();

  final _scrollController = ScrollController();

  _getData() async {
    _isLoaded = true;
    final parsedMovies =
    // await locator<MovieService>().getByPage(_currentPage);
    await locator<PaginationService>(instanceName: 'movie_service').getByPage(
        _currentPage);
    setState(() {
      _movies = List.from(_movies)
        ..addAll(parsedMovies ?? List.empty());
      _currentPage++;
      _isLoaded = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200 &&
          !_isLoaded) {
        _getData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: _movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: _movies[index]);
      },
    );
  }
}
