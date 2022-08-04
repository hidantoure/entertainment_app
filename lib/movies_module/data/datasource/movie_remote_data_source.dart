import 'package:dio/dio.dart';
import 'package:entertainment_app/core/error/exception.dart';
import 'package:entertainment_app/core/network/error_message_model.dart';
import 'package:entertainment_app/movies_module/data/models/movie_model.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=72b66dbbb9816e3f20405337150e741a");

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
