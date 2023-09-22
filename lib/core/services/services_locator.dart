import 'package:get_it/get_it.dart';
import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_respository.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_now_playing_movie_usecase.dart';
import '../../movies/domain/usecases/get_populer_movies_usecase.dart';
import '../../movies/domain/usecases/get_recommendations_usecase.dart';
import '../../movies/presentation/controller/movie_details_bloc.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controller/movies_bloc.dart';

///sl >>> service locator
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///MoviesBloc
    sl.registerFactory(
      () => MoviesBloc(
        getNowPlayingMovieUseCase: sl(),
        getPopulerMoviesUseCase: sl(),
        getTopRatedMoviesUseCase: sl(),
      ),
    );

    ///MoviesBloc
    sl.registerFactory(
      () => MovieDetailsBloc(
        getMovieDetailsUsecase: sl(),
        getRecommendationsUsecase: sl(),
      ),
    );

    ///USECASES
    sl.registerLazySingleton(
        () => GetMovieDetailsUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetRecommendationsUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(() => GetNowPlayingMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetPopulerMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRpository(baseMoviesRemoteDataSource: sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
