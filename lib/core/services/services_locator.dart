import 'package:entertainment_app/movies_module/data/datasource/movie_remote_data_source.dart';
import 'package:entertainment_app/movies_module/data/repository/movies_repository.dart';
import 'package:entertainment_app/movies_module/domain/repository/base_movies_repository.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_popular_movies_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:entertainment_app/movies_module/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// MoviesBloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    /// UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
