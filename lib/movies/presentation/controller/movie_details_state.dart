import 'package:equatable/equatable.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entites/movie_details.dart';
import '../../domain/entites/recommendations.dart';
import '../../data/models/movie_details_model.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  
  final List<Recommendation> recommendations;
  final RequestState recommendationState;
  final String recommendationsMessage;

  const MovieDetailsState({
    this.movieDetails = const MovieDetialsModel(
      backdropPath:
          "https://www.istockphoto.com/photo/empty-cinema-screen-with-audience-gm453554783-24692123",
      genres: [],
      id: 0,
      overview: "",
      releaseDate: "",
      runtime: 0,
      title: "",
      voteAverage: 0.0,
    ),
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = "",
    this.recommendations = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationsMessage = "",
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendations,
    RequestState? recommendationState,
    String? recommendationsMessage,
  }) {
    return MovieDetailsState(
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendations: recommendations ?? this.recommendations,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationsMessage:
          recommendationsMessage ?? this.recommendationsMessage,
    );
  }

  @override
  List<Object> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendations,
        recommendationState,
        recommendationsMessage,
      ];
}
