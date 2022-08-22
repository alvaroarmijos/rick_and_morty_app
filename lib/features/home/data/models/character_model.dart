import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';

class CharacterModel extends Character {
  const CharacterModel(
      {required this.name,
      required this.image,
      required this.gender,
      required this.status,
      required this.episode})
      : super(
            name: name,
            image: image,
            gender: gender,
            status: status,
            episode: episode);

  final String name;
  final String image;
  final String gender;
  final String status;
  final List<String> episode;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        name: json["name"],
        status: json["status"],
        gender: json["gender"],
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
        "gender": gender,
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
      };
}
