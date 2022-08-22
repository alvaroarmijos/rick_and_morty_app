import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/error/exception.dart';
import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/core/platform/network_info.dart';
import 'package:rick_and_morty_app/features/home/data/datasources/rick_and_morty_remote_data_source.dart';
import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';
import 'package:rick_and_morty_app/features/home/domain/repositories/rick_and_morty_repository.dart';

typedef Future<Results> _GetAllCharacters();
typedef Future<Results> _GetNextCharacters();
typedef Future<Results> _GetAllCharactersGender();

class RickAndMortyRepositoryImpl implements RickAndMortyRepository {
  final RickAndMortyRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RickAndMortyRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Results>> getAllCharacters() async {
    return await _getAllCharacters(() {
      return remoteDataSource.getAllCharacters();
    });
  }

  Future<Either<Failure, Results>> _getAllCharacters(
      _GetAllCharacters getAllCharacters) async {
    if (await networkInfo.isConnected) {
      try {
        final results = await getAllCharacters();
        return Right(results);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Results>> getNextCharacters(String next) async {
    return await _getNextCharacters(() {
      return remoteDataSource.getNextCharacters(next);
    });
  }

  Future<Either<Failure, Results>> _getNextCharacters(
      _GetNextCharacters getNextCharacters) async {
    if (await networkInfo.isConnected) {
      try {
        final results = await getNextCharacters();
        return Right(results);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Results>> getAllCharactersGender(String gender) async {
    return await _getAllCharactersGender(() {
      return remoteDataSource.getAllCharactersGender(gender);
    });
  }

  Future<Either<Failure, Results>> _getAllCharactersGender(
      _GetAllCharactersGender getAllCharactersGender) async {
    if (await networkInfo.isConnected) {
      try {
        final results = await getAllCharactersGender();
        return Right(results);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
