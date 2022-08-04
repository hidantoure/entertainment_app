import 'package:entertainment_app/movies_module/domain/repository/base_movies_repository.dart';
import '../entities/movie.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository _baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this._baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await _baseMoviesRepository.getNowPlayingMovies();
  }
}
