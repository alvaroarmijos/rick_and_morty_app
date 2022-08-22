import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/core/usecases/usecase.dart';
import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';
import 'package:rick_and_morty_app/features/home/domain/repositories/rick_and_morty_repository.dart';

class GetNextOrPrevCharacters extends UseCase<Results, Params> {
  final RickAndMortyRepository repository;

  GetNextOrPrevCharacters(this.repository);

  @override
  Future<Either<Failure, Results>> call(Params params) async {
    return await repository.getNextCharacters(params.next);
  }
}

class Params extends Equatable {
  final String next;

  const Params({required this.next});

  @override
  List<Object?> get props => [next];
}
