import 'package:entertainment_app/movies_module/data/datasource/movie_remote_data_source.dart';
import 'package:entertainment_app/movies_module/data/repository/movies_repository.dart';
import 'package:entertainment_app/movies_module/domain/repository/base_movies_repository.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_movie_details_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_popular_movies_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_recommendation_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:entertainment_app/movies_module/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:entertainment_app/movies_module/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// MoviesBloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
  }
}
