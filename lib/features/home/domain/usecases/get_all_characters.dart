import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/core/usecases/usecase.dart';
import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';
import 'package:rick_and_morty_app/features/home/domain/repositories/rick_and_morty_repository.dart';

class GetAllCharacters extends UseCase<Results, NoParams> {
  final RickAndMortyRepository repository;

  GetAllCharacters(this.repository);

  @override
  Future<Either<Failure, Results>> call(NoParams params) async {
    return await repository.getAllCharacters();
  }
}
