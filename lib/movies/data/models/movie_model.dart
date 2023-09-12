import 'package:movies_app/movies/domain/entites/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.backdropPath,
    required super.genreIds,
    required super.title,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      backdropPath: json["backdrop_path"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      title: json["title"],
      overview: json["overview"],
      voteAverage: json["vote_average"],
      releaseDate: json["release_date"],
    );
  }
}
