import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/core/usecases/usecase.dart';
import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';
import 'package:rick_and_morty_app/features/home/domain/usecases/usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllCharacters getAllCharacters;
  final GetNextOrPrevCharacters getNextOrPrevCharacters;
  final GetAllCharactersGender getAllCharactersGender;
  HomeBloc({
    required this.getAllCharacters,
    required this.getNextOrPrevCharacters,
    required this.getAllCharactersGender,
  }) : super(Empty()) {
    on<InitCharacters>((event, emit) async {
      emit(Loading());
      final failureOrPosts = await getAllCharacters(NoParams());
      emit(failureOrPosts.fold(
        (failure) => Error(
          message: _mapFailureToMessage(failure),
        ),
        (results) => Loaded(results: results),
      ));
    });

    on<InitCharactersGender>((event, emit) async {
      emit(Loading());
      final failureOrPosts =
          await getAllCharactersGender(ParamsGender(gender: event.gender));
      emit(failureOrPosts.fold(
        (failure) => Error(
          message: _mapFailureToMessage(failure),
        ),
        (results) => Loaded(results: results),
      ));
    });

    on<ChangePage>((event, emit) async {
      if (event.url == null) return;
      emit(Loading());
      final failureOrPosts =
          await getNextOrPrevCharacters(Params(next: event.url!));
      emit(failureOrPosts.fold(
        (failure) => Error(
          message: _mapFailureToMessage(failure),
        ),
        (results) => Loaded(results: results),
      ));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    // Instead of a regular 'if (failure is ServerFailure)...'
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
