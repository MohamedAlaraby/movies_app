import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';

import '../../../core/error/failure.dart';
import '../repository/base_movies_repository.dart';

class GetNowPlayingMovieUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMovieUseCase(this.baseMoviesRepository);

  Future<Either<Failure ,List<Movie>>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovie();
  }
}
