// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final List<int> genreIds;
  final String title;
  final String overview;
  final num voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.genreIds,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props {
    return [
      id,
      backdropPath,
      genreIds,
      title,
      overview,
      voteAverage,
      releaseDate
    ];
  }
}
