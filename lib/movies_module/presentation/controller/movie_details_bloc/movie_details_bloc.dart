import 'dart:async';

import 'package:entertainment_app/core/utils/enums.dart';
import 'package:entertainment_app/movies_module/domain/entities/movie_detail.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_movie_details_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this._getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await _getMovieDetailsUseCase
        .call(MovieDetailsParameters(movieDetail: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetail: r, movieDetailsState: RequestState.loaded)));
  }
}
