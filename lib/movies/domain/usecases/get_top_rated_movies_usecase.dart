import 'package:dartz/dartz.dart';
import '../../../core/usecases/base_usecases.dart';
import '../entites/movie.dart';
import '../repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase <List<Movie>,NoParameters > {
  final BaseMoviesRepository baseMoviesRepository;
  //This is an dependency Injection.
  GetTopRatedMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
