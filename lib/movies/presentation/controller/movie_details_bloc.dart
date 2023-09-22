import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendations_usecase.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationsUsecase getRecommendationsUsecase;
  MovieDetailsBloc({
    required this.getMovieDetailsUsecase,
    required this.getRecommendationsUsecase,
  }) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetials);
    on<GetRecommedationsEvent>(_getRecommendations);
  }

  FutureOr<void> _getMovieDetials(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result =
        await getMovieDetailsUsecase(MovieDetailsParameters(movieId: event.id));

    result.fold(
      (l) {
        emit(state.copyWith(
          movieDetailsMessage: l.message,
          movieDetailsState: RequestState.error,
        ));
      },
      (r) {
        emit(state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ));
      },
    );
  }

  FutureOr<void> _getRecommendations(
    GetRecommedationsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result =
        await getRecommendationsUsecase(RecommendaionParameters(id: event.id));

    result.fold(
      (l) {
        emit(state.copyWith(
          recommendationsMessage: l.message,
          recommendationState: RequestState.error,
        ));
      },
      (r) {
        emit(state.copyWith(
          recommendations: r,
          recommendationState: RequestState.loaded,
        ));
      },
    );
  }
}
