import 'package:flutter/material.dart';
import 'package:movie_browse/models/movie.dart';
import 'package:movie_browse/services/pagination_service.dart';

class MovieViewmodel extends ChangeNotifier {
  final PaginationService<List<Movie>?> _paginationService;

  int _currentPage = 1;
  bool _isLoading = false;
  final List<Movie> _movies = [];

  bool get isLoading => _isLoading;
  List<Movie> get movies => List.unmodifiable(_movies);

  MovieViewmodel(this._paginationService);

  Future<void> fetchMovies() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final receivedMovies = await _paginationService.getByPage(_currentPage);
      if (receivedMovies != null) {
        _movies.addAll(receivedMovies);
        _currentPage++;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
