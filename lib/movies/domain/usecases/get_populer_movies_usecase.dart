import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetPopulerMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopulerMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure ,List<Movie>>> execute() async {
    return await baseMoviesRepository.getPopulerMovies();
  }
}
