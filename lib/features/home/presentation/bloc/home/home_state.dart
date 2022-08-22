part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final Results? results;
  const HomeState({this.results});

  @override
  List<Object> get props => [];
}

class Empty extends HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final Results results;

  const Loaded({required this.results});
  @override
  List<Object> get props => [results];
}

class Error extends HomeState {
  final String message;

  const Error({required this.message});

  List<Object> get props => [message];
}
