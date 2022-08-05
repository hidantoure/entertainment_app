import 'package:dartz/dartz.dart';
import 'package:entertainment_app/movies_module/domain/entities/movie.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
