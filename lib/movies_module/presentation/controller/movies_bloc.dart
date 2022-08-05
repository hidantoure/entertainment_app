import 'package:entertainment_app/core/utils/enums.dart';
import 'package:entertainment_app/movies_module/data/datasource/movie_remote_data_source.dart';
import 'package:entertainment_app/movies_module/data/repository/movies_repository.dart';
import 'package:entertainment_app/movies_module/domain/repository/base_movies_repository.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:entertainment_app/movies_module/presentation/controller/movies_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        BaseMovieRemoteDataSource baseMovieRemoteDataSource =
            MovieRemoteDataSource();
        BaseMoviesRepository baseMoviesRepository =
            MoviesRepository(baseMovieRemoteDataSource);
        final result =
            await GetNowPlayingMoviesUseCase(baseMoviesRepository).execute();
        emit(
          const MoviesState(
            nowPlayingState: RequestState.loaded,
          ),
        );
        result.fold(
          (l) => emit(
            MoviesState(
              nowPlayingState: RequestState.error,
              message: l.message,
            ),
          ),
          (r) => emit(
            MoviesState(
                nowPlayingMovies: r, nowPlayingState: RequestState.loaded),
          ),
        );
      },
    );
  }
}
