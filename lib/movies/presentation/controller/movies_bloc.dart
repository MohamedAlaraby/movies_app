import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/usecases/base_usecases.dart';
import '../../domain/usecases/get_populer_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';
import '../../../core/utils/enums.dart';
import '../../domain/usecases/get_now_playing_movie_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopulerMoviesUseCase getPopulerMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc({
    required this.getPopulerMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
    required this.getNowPlayingMovieUseCase,
  }) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMovieUseCase(const NoParameters());

    result.fold(
      (l) => emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingStateMessage: l.message)),
      (r) => emit(state.copyWith(
          nowPlaingMovies: r, nowPlayingState: RequestState.loaded)),
    );
  }

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold((l) {
      emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedStateMessage: l.message,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: r,
        ),
      );
    });
  }

  Future<FutureOr<void>> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopulerMoviesUseCase(const NoParameters());
    result.fold((l) {
      emit(
        state.copyWith(
          popularState: RequestState.error,
          popularStateMessage: l.message,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        ),
      );
    });
  }
}
