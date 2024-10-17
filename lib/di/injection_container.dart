import 'package:get_it/get_it.dart';
import 'package:movie_browse/services/movie_service.dart';
import 'package:movie_browse/services/pagination_service.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<PaginationService>(MovieService(),
      instanceName: "movie_service");
}
