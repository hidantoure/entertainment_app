import 'package:dartz/dartz.dart';
import 'package:entertainment_app/movies_module/domain/entities/movie.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_movie_details_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_recommendation_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_detail.dart';
import '../entities/recommendation.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationParameters parameters);
}
