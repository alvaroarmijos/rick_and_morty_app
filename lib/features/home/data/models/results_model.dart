import 'package:rick_and_morty_app/features/home/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/home/data/models/info_model.dart';
import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';

class ResultsModel extends Results {
  const ResultsModel({
    required this.info,
    required this.characters,
  }) : super(
          info: info,
          characters: characters,
        );

  final InfoModel info;
  final List<CharacterModel> characters;

  factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
        info: InfoModel.fromJson(json["info"]),
        characters: List<CharacterModel>.from(
            json["results"].map((x) => CharacterModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(characters.map((x) => x.toJson())),
      };
}
