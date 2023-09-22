import 'dart:developer';

import 'package:dio/dio.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';
import '../models/recommendation_model.dart';
import '../../domain/entites/movie_details.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendations_usecase.dart';
import '../../../core/error/exception.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopulerMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetails> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendations(
      RecommendaionParameters parameters);
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

  @override
  Future<MovieDetails> getMovieDetails(
      MovieDetailsParameters parameters) async {
    Response response =
        await dio.get(ApiConstants.movieDetailsEndPoint(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetialsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(
      RecommendaionParameters parameters) async {
    final result = await dio.get(
      ApiConstants.recommendationsEndPoint(parameters.id),
    );

    if (result.statusCode == 200) {
      print("The recommendations status code is ${result.statusCode}");
      return List<RecommendationModel>.from(
        (result.data["results"] as List).map(
          (recommendation) => RecommendationModel.fromJson(recommendation),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(result.data),
      );
    }
  }
}
