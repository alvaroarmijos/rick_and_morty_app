import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_app/core/error/exception.dart';
import 'package:rick_and_morty_app/features/home/data/datasources/rick_and_morty_remote_data_source.dart';
import 'package:rick_and_morty_app/features/home/data/models/results_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockUri extends Fake implements Uri {}

void main() {
  late RickAndMortyRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RickAndMortyRemoteDataSourceImpl(client: mockHttpClient);
  });

  setUpAll(() {
    registerFallbackValue(MockUri());
  });

  void setUpMockHttpClientFailure404() {
    when(() => mockHttpClient.get(any(), headers: any(named: "headers")))
        .thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  group('getAllCharacters', () {
    final tResults =
        ResultsModel.fromJson(json.decode(fixture('results.json')));
    test(
      'should preform a GET request on a URL being the endpoint and with application/json header',
      () {
        //arrange
        when(() => mockHttpClient.get(any(), headers: any(named: "headers")))
            .thenAnswer(
          (_) async => http.Response(fixture('results.json'), 200),
        );
        // act
        dataSource.getAllCharacters();
        // assert
        verify(() => mockHttpClient.get(
              Uri.parse('https://rickandmortyapi.com/api/character'),
              headers: {'Content-Type': 'application/json'},
            ));
      },
    );

    test(
      'should return Results when the response code is 200 (success)',
      () async {
        // arrange
        when(() => mockHttpClient.get(any(), headers: any(named: "headers")))
            .thenAnswer(
          (_) async => http.Response(fixture('results.json'), 200),
        );
        // act
        final result = await dataSource.getAllCharacters();
        // assert
        expect(result, equals(tResults));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getAllCharacters;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });

  group('getAllCharactersGender', () {
    const tGender = 'male';
    final tResults =
        ResultsModel.fromJson(json.decode(fixture('results.json')));
    test(
      'should preform a GET request on a URL being the endpoint and with application/json header',
      () {
        //arrange
        when(() => mockHttpClient.get(any(), headers: any(named: "headers")))
            .thenAnswer(
          (_) async => http.Response(fixture('results.json'), 200),
        );
        // act
        dataSource.getAllCharactersGender(tGender);
        // assert
        verify(() => mockHttpClient.get(
              Uri.parse(
                  'https://rickandmortyapi.com/api/character?gender=male'),
              headers: {'Content-Type': 'application/json'},
            ));
      },
    );

    test(
      'should return Results when the response code is 200 (success)',
      () async {
        // arrange
        when(() => mockHttpClient.get(any(), headers: any(named: "headers")))
            .thenAnswer(
          (_) async => http.Response(fixture('results.json'), 200),
        );
        // act
        final result = await dataSource.getAllCharactersGender(tGender);
        // assert
        expect(result, equals(tResults));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getAllCharactersGender;
        // assert
        expect(() => call(tGender), throwsA(isA<ServerException>()));
      },
    );
  });

  group('getNextCharacters', () {
    const tNext = 'https://rickandmortyapi.com/api/character/?page=2';
    final tResults =
        ResultsModel.fromJson(json.decode(fixture('results.json')));
    test(
      'should preform a GET request on a URL being the endpoint and with application/json header',
      () {
        //arrange
        when(() => mockHttpClient.get(any(), headers: any(named: "headers")))
            .thenAnswer(
          (_) async => http.Response(fixture('results.json'), 200),
        );
        // act
        dataSource.getNextCharacters(tNext);
        // assert
        verify(() => mockHttpClient.get(
              Uri.parse('https://rickandmortyapi.com/api/character/?page=2'),
              headers: {'Content-Type': 'application/json'},
            ));
      },
    );

    test(
      'should return Results when the response code is 200 (success)',
      () async {
        // arrange
        when(() => mockHttpClient.get(any(), headers: any(named: "headers")))
            .thenAnswer(
          (_) async => http.Response(fixture('results.json'), 200),
        );
        // act
        final result = await dataSource.getNextCharacters(tNext);
        // assert
        expect(result, equals(tResults));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getNextCharacters;
        // assert
        expect(() => call(tNext), throwsA(isA<ServerException>()));
      },
    );
  });
}
