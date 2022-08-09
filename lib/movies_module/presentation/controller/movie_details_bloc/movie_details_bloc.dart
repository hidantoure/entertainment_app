import 'dart:async';

import 'package:entertainment_app/core/utils/enums.dart';
import 'package:entertainment_app/movies_module/domain/entities/movie_detail.dart';
import 'package:entertainment_app/movies_module/domain/entities/recommendation.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_movie_details_usecase.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_recommendation_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this._getMovieDetailsUseCase, this._getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRequemendationEvent>(_getMovieRecommendations);
  }
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final GetRecommendationUseCase _getRecommendationUseCase;

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

  FutureOr<void> _getMovieRecommendations(GetMovieRequemendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await _getRecommendationUseCase
        .call(RecommendationParameters(id: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            recommendationsState: RequestState.error,
            recommendationsMessage: l.message)),
        (r) => emit(state.copyWith(
            recommendations: r, recommendationsState: RequestState.loaded)));
  }
}
