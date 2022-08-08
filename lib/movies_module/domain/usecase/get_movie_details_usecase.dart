import 'package:entertainment_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:entertainment_app/core/usecase/base_usecase.dart';
import 'package:entertainment_app/movies_module/domain/entities/movie_detail.dart';
import 'package:equatable/equatable.dart';

import '../repository/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final BaseMoviesRepository _baseMoviesRepository;

  GetMovieDetailsUseCase(this._baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
    return await _baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieDetail;
  const MovieDetailsParameters({
    required this.movieDetail,
  });

  @override
  List<Object?> get props => [movieDetail];
}
