import 'genres_model.dart';
import '../../domain/entites/movie_details.dart';

class MovieDetialsModel extends MovieDetails {
  const MovieDetialsModel({
    required super.id,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.runtime,
    required super.genres,
  });

  factory MovieDetialsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetialsModel(
        id: json["id"],
        backdropPath: json["backdrop_path"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        runtime: json["runtime"],
        genres: List<GenresModel>.from(
            json["genres"].map((e) => GenresModel.fromJson(e))),
      );
}
