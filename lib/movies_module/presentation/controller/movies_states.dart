import 'package:entertainment_app/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String message;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.message = '',
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        message,
      ];
}
