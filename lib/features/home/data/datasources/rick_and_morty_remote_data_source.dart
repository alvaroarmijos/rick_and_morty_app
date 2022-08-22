import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/core/error/exception.dart';
import 'package:rick_and_morty_app/core/global/global_variables.dart';
import 'package:rick_and_morty_app/features/home/data/models/results_model.dart';
import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';
import 'package:rick_and_morty_app/features/home/domain/usecases/get_next_characters.dart';

abstract class RickAndMortyRemoteDataSource {
  /// Calls the https://rickandmortyapi.com/api/character endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Results> getAllCharacters();

  /// Calls the https://rickandmortyapi.com/api/character?page=? endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Results> getNextCharacters(String next);

  /// Calls the https://rickandmortyapi.com/api/character?gender=? endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Results> getAllCharactersGender(String gender);
}

class RickAndMortyRemoteDataSourceImpl implements RickAndMortyRemoteDataSource {
  final http.Client client;

  RickAndMortyRemoteDataSourceImpl({required this.client});

  @override
  Future<Results> getAllCharacters() async {
    final response = await client.get(
      Uri.parse(GlobalVariables.baseUrl),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return ResultsModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Results> getNextCharacters(String next) async {
    final response = await client.get(
      Uri.parse(next),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return ResultsModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Results> getAllCharactersGender(String gender) async {
    final response = await client.get(
      Uri.parse("${GlobalVariables.baseUrl}?gender=$gender"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return ResultsModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
