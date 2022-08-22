import 'package:equatable/equatable.dart';

class Character extends Equatable {
  const Character({
    required this.name,
    required this.image,
    required this.gender,
    required this.status,
    required this.episode,
  });

  final String name;
  final String image;
  final String gender;
  final String status;
  final List<String> episode;

  @override
  List<Object?> get props => [
        [
          name,
          image,
          gender,
          status,
          episode,
        ]
      ];
}
