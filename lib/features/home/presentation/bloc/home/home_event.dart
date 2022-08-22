part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitCharacters extends HomeEvent {
  const InitCharacters();
  @override
  List<Object> get props => [];
}

class InitCharactersGender extends HomeEvent {
  final String gender;
  const InitCharactersGender({required this.gender});
  @override
  List<Object> get props => [];
}

class ChangePage extends HomeEvent {
  final String? url;
  const ChangePage({required this.url});
  @override
  List<Object> get props => [];
}
