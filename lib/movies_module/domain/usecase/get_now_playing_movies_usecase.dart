import 'package:dartz/dartz.dart';
import 'package:entertainment_app/core/usecase/base_usecase.dart';
import 'package:entertainment_app/movies_module/domain/repository/base_movies_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository _baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this._baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await _baseMoviesRepository.getNowPlayingMovies();
  }
}
