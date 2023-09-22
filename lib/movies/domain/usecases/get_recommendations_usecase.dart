import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecases/base_usecases.dart';
import '../entites/recommendations.dart';
import '../repository/base_movies_repository.dart';

class GetRecommendationsUsecase
    extends BaseUseCase<List<Recommendation>, RecommendaionParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationsUsecase({required this.baseMoviesRepository});
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendaionParameters parameters) async {
    return await baseMoviesRepository.getRecommendations(parameters);
  }
}

class RecommendaionParameters extends Equatable {
  final int id;
  const RecommendaionParameters({required this.id});
  @override
  List<Object> get props => [id];
}
