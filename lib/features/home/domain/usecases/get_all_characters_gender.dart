import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/core/usecases/usecase.dart';
import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';
import 'package:rick_and_morty_app/features/home/domain/repositories/rick_and_morty_repository.dart';

class GetAllCharactersGender extends UseCase<Results, ParamsGender> {
  final RickAndMortyRepository repository;

  GetAllCharactersGender(this.repository);

  @override
  Future<Either<Failure, Results>> call(ParamsGender params) async {
    return await repository.getAllCharactersGender(params.gender);
  }
}

class ParamsGender extends Equatable {
  final String gender;

  const ParamsGender({required this.gender});

  @override
  List<Object?> get props => [gender];
}
