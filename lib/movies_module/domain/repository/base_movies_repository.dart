import 'package:entertainment_app/movies_module/domain/entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}
