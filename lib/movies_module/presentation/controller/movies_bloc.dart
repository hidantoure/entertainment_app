import 'package:entertainment_app/core/utils/enums.dart';

import 'package:entertainment_app/movies_module/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:entertainment_app/movies_module/presentation/controller/movies_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase _getNowPlayingMoviesUseCase;
  MoviesBloc(this._getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        final result = await _getNowPlayingMoviesUseCase.execute();
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
