// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entites/genres.dart';

///We use Equatable to prevent the duplicated instances in memory.
abstract class MovieDetails extends Equatable {
  final int id;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int runtime;
  final List<Genres> genres;
  const MovieDetails( {
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.runtime,
    required this.genres,
  });

  @override
  List<Object> get props {
    return [
      id,
      backdropPath,
      overview,
      releaseDate,
      title,
      voteAverage,
      runtime,
      genres
    ];
  }
}
