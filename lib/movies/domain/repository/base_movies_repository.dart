import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();
  Future<Either<Failure, List<Movie>>> getPopulerMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
