import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_browse/models/movie.dart';
import 'package:movie_browse/services/pagination_service.dart';

class MovieService implements PaginationService<List<Movie>?> {
  @override
  Future<List<Movie>?> getByPage(int page) async {
    final uri = Uri.parse(
        "https://api.themoviedb.org/3/trending/movie/day?api_key=${dotenv.env['API_KEY']}&page=$page");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];

      return results.map((json) => Movie.fromJson(json)).toList();
    }
    return null;
  }
}
