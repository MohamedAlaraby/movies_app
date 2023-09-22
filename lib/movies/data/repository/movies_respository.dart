import 'package:dartz/dartz.dart';
import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../datasource/movie_remote_data_source.dart';
import '../../domain/entites/movie.dart';
import '../../domain/entites/movie_details.dart';
import '../../domain/entites/recommendations.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendations_usecase.dart';

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

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMoviesRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendaionParameters parameters) async {
    final result =
        await baseMoviesRemoteDataSource.getRecommendations(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
