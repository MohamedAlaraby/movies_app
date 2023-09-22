import 'package:dartz/dartz.dart';
import '../entites/movie.dart';
import '../entites/movie_details.dart';
import '../entites/recommendations.dart';
import '../usecases/get_movie_details_usecase.dart';
import '../usecases/get_recommendations_usecase.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();
  Future<Either<Failure, List<Movie>>> getPopulerMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendaionParameters parameters);
}
