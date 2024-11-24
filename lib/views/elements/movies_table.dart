import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_browse/di/injection_container.dart';
import 'package:movie_browse/viewmodels/movie_viewmodel.dart';
import 'movie_card.dart';

class MoviesTable extends StatelessWidget {
  const MoviesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => locator<MovieViewmodel>(),
      child: const _MoviesTableContent(),
    );
  }
}

class _MoviesTableContent extends StatefulWidget {
  const _MoviesTableContent();

  @override
  State<_MoviesTableContent> createState() => _MoviesTableContentState();
}

class _MoviesTableContentState extends State<_MoviesTableContent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieViewmodel>(context, listen: false).fetchMovies();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !Provider.of<MovieViewmodel>(context, listen: false).isLoading) {
        Provider.of<MovieViewmodel>(context, listen: false).fetchMovies();
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
    final viewModel = Provider.of<MovieViewmodel>(context);

    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: viewModel.movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: viewModel.movies[index]);
      },
    );
  }
}
