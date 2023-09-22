import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetRecommedationsEvent extends MovieDetailsEvent {
  final int id;
  const GetRecommedationsEvent({required this.id});
  @override
  List<Object> get props => [id];
}
