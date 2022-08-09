import 'package:dartz/dartz.dart';
import 'package:entertainment_app/core/error/exception.dart';
import 'package:entertainment_app/core/error/failure.dart';
import 'package:entertainment_app/movies_module/data/datasource/movie_remote_data_source.dart';
import 'package:entertainment_app/movies_module/domain/entities/movie.dart';
import 'package:entertainment_app/movies_module/domain/entities/movie_detail.dart';
import 'package:entertainment_app/movies_module/domain/entities/recommendation.dart';
import 'package:entertainment_app/movies_module/domain/repository/base_movies_repository.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_movie_details_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_recommendation_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource _baseMovieRemoteDataSource;
  MoviesRepository(this._baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await _baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await _baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await _baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await _baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationParameters parameters) async {
    final result =
        await _baseMovieRemoteDataSource.getRecommendations(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
