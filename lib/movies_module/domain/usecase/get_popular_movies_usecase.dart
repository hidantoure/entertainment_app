import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository _baseMoviesRepository;

  GetPopularMoviesUseCase(this._baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await _baseMoviesRepository.getPopularMovies();
  }
}
