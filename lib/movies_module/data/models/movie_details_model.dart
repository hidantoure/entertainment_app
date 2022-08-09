import 'package:entertainment_app/movies_module/data/models/genres_model.dart';
import 'package:entertainment_app/movies_module/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json["backdrop_path"],
        genres: List<GenresModel>.from(
            json['genres'].map((x) => GenresModel.fromJson(x))),
        // genres: List<GenresModel>.from(
        //     json['genres'].map((x) => GenresModel.fromJson(json))),
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
