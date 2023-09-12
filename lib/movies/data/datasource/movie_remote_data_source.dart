import 'package:dio/dio.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import '../../../core/error/exception.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopulerMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        headers: {
          "Authorization": "Bearer ${ApiConstants.authToken}",
          "accept": "application/json"
        },
      ),
    );
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await dio.get(ApiConstants.nowPlayingMovieEndPoint);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopulerMovies() async {
    final response = await dio.get(ApiConstants.populerMoviesEndPoint);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList());
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await dio.get(ApiConstants.topRatedMoviesEndPoint);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList());
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
