// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Recommendation extends Equatable {
  final int id;
  final String? backdropPath;

  const Recommendation({required this.id, this.backdropPath});

  @override
  List<Object?> get props => [id, backdropPath];
}
