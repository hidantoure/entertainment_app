import 'package:entertainment_app/movies_module/data/datasource/movie_remote_data_source.dart';
import 'package:entertainment_app/movies_module/data/repository/movies_repository.dart';
import 'package:entertainment_app/movies_module/domain/repository/base_movies_repository.dart';
import 'package:entertainment_app/movies_module/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:entertainment_app/movies_module/presentation/controller/movies_bloc.dart';
import 'package:entertainment_app/movies_module/presentation/controller/movies_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/movies_states.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MoviesBloc()..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: ((context, state) {
          return const Scaffold();
        }),
      ),
    );
  }
}
