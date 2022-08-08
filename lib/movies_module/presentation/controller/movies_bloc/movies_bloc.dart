import 'dart:async';

import 'package:entertainment_app/core/usecase/base_usecase.dart';
import 'package:entertainment_app/core/utils/enums.dart';

import 'package:entertainment_app/movies_module/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_popular_movies_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:entertainment_app/movies_module/presentation/controller/movies_bloc/movies_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase _getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;
  MoviesBloc(this._getNowPlayingMoviesUseCase, this._getPopularMoviesUseCase,
      this._getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await _getNowPlayingMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await _getPopularMoviesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            popularMoviesState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularMovies: r, popularMoviesState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await _getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedMoviesState: RequestState.error,
            topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedMoviesState: RequestState.loaded)));
  }
}
