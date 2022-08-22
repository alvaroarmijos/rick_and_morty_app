import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_app/core/error/exception.dart';
import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/core/platform/network_info.dart';
import 'package:rick_and_morty_app/features/home/data/datasources/rick_and_morty_remote_data_source.dart';
import 'package:rick_and_morty_app/features/home/data/models/results_model.dart';
import 'package:rick_and_morty_app/features/home/data/repositories/rick_and_morty_repository_impl.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockRemoteDataSource extends Mock
    implements RickAndMortyRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late RickAndMortyRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = RickAndMortyRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getAllCharacters', () {
    final tResults =
        ResultsModel.fromJson(json.decode(fixture('results.json')));
    test('should check if the device is online', () async {
      //arrange
      when(() => mockRemoteDataSource.getAllCharacters())
          .thenAnswer((_) async => tResults);
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      repository.getAllCharacters();
      // assert
      verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      // This setUp applies only to the 'device is online' group
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getAllCharacters())
              .thenAnswer((_) async => tResults);
          // act
          final result = await repository.getAllCharacters();
          // assert
          verify(() => mockRemoteDataSource.getAllCharacters());
          expect(result, equals(Right(tResults)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getAllCharacters())
              .thenThrow(ServerException());
          // act
          final result = await repository.getAllCharacters();
          // assert
          verify(() => mockRemoteDataSource.getAllCharacters());
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });
  });

  group('getNextCharacters', () {
    const tNext = 'https://rickandmortyapi.com/api/character/?page=2';
    final tResults =
        ResultsModel.fromJson(json.decode(fixture('results.json')));
    test('should check if the device is online', () async {
      //arrange
      when(() => mockRemoteDataSource.getNextCharacters(tNext))
          .thenAnswer((_) async => tResults);
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      repository.getNextCharacters(tNext);
      // assert
      verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      // This setUp applies only to the 'device is online' group
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getNextCharacters(tNext))
              .thenAnswer((_) async => tResults);
          // act
          final result = await repository.getNextCharacters(tNext);
          // assert
          verify(() => mockRemoteDataSource.getNextCharacters(tNext));
          expect(result, equals(Right(tResults)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getNextCharacters(tNext))
              .thenThrow(ServerException());
          // act
          final result = await repository.getNextCharacters(tNext);
          // assert
          verify(() => mockRemoteDataSource.getNextCharacters(tNext));
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });
  });

  group('getAllCharactersGender', () {
    const tGender = 'male';
    final tResults =
        ResultsModel.fromJson(json.decode(fixture('results.json')));
    test('should check if the device is online', () async {
      //arrange
      when(() => mockRemoteDataSource.getAllCharactersGender(tGender))
          .thenAnswer((_) async => tResults);
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      repository.getAllCharactersGender(tGender);
      // assert
      verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      // This setUp applies only to the 'device is online' group
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getAllCharactersGender(tGender))
              .thenAnswer((_) async => tResults);
          // act
          final result = await repository.getAllCharactersGender(tGender);
          // assert
          verify(() => mockRemoteDataSource.getAllCharactersGender(tGender));
          expect(result, equals(Right(tResults)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getAllCharactersGender(tGender))
              .thenThrow(ServerException());
          // act
          final result = await repository.getAllCharactersGender(tGender);
          // assert
          verify(() => mockRemoteDataSource.getAllCharactersGender(tGender));
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });
  });
}
