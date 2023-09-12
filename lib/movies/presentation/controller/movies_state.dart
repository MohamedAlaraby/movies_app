// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';

class MoviesState extends Equatable {
  ///NOW PLAYING STATE HANDLING
  final List<Movie> nowPlaingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingStateMessage;

  ///POPULAR STATE HANDLING
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularStateMessage;

  ///POPULAR STATE HANDLING
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedStateMessage;

  const MoviesState({
    this.nowPlaingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingStateMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularStateMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedStateMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlaingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingStateMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularStateMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedStateMessage,
  }) =>
      MoviesState(
          nowPlaingMovies: nowPlaingMovies ?? this.nowPlaingMovies,
          nowPlayingState: nowPlayingState ?? this.nowPlayingState,
          nowPlayingStateMessage:
              nowPlayingStateMessage ?? this.nowPlayingStateMessage,
          popularMovies: popularMovies ?? this.popularMovies,
          popularState: popularState ?? this.popularState,
          popularStateMessage: popularStateMessage ?? this.popularStateMessage,
          topRatedMovies: topRatedMovies ?? this.topRatedMovies,
          topRatedState: topRatedState ?? this.topRatedState,
          topRatedStateMessage:
              topRatedStateMessage ?? this.topRatedStateMessage);
  @override
  List<Object> get props {
    return [
      nowPlaingMovies,
      nowPlayingState,
      nowPlayingStateMessage,
      popularMovies,
      popularState,
      popularStateMessage,
      topRatedMovies,
      topRatedState,
      topRatedStateMessage,
    ];
  }
}
