import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';

abstract class RickAndMortyRepository {
  Future<Either<Failure, Results>> getAllCharacters();
  Future<Either<Failure, Results>> getNextCharacters(String next);
  Future<Either<Failure, Results>> getAllCharactersGender(String gender);
}
