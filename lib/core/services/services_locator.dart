import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_respository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_populer_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controller/movies_bloc.dart';

final serviceLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    ///BLOC
    serviceLocator.registerFactory(
      () => MoviesBloc(
        getNowPlayingMovieUseCase: serviceLocator(),
        getPopulerMoviesUseCase: serviceLocator(),
        getTopRatedMoviesUseCase: serviceLocator(),
      ),
    );

    ///USECASES
    serviceLocator.registerLazySingleton(
        () => GetNowPlayingMovieUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetPopulerMoviesUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(serviceLocator()));

    ///REPOSITORY
    serviceLocator.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRpository(baseMoviesRemoteDataSource: serviceLocator()));

    ///DATA SOURCE
    serviceLocator.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
