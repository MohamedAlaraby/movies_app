import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class MoviesRpository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMoviesRemoteDataSource;
  MoviesRpository({required this.baseMoviesRemoteDataSource});
  //<Either<Failure ,List<Movie>>> always the failure be in the left and success on the right.

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopulerMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopulerMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
