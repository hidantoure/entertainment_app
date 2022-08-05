import 'package:dartz/dartz.dart';
import 'package:entertainment_app/movies_module/domain/repository/base_movies_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository _baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this._baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await _baseMoviesRepository.getNowPlayingMovies();
  }
}
