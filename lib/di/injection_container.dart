import 'package:get_it/get_it.dart';
import 'package:movie_browse/models/movie.dart';
import 'package:movie_browse/services/movie_service.dart';
import 'package:movie_browse/services/pagination_service.dart';
import 'package:movie_browse/viewmodels/movie_viewmodel.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<PaginationService<List<Movie>?>>(MovieService(),
      instanceName: "movie_service");

  locator.registerFactory(() => MovieViewmodel(
      locator<PaginationService<List<Movie>?>>(instanceName: "movie_service")));
}
