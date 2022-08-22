import 'package:equatable/equatable.dart';

import 'entities.dart';

class Results extends Equatable {
  const Results({
    required this.info,
    required this.characters,
  });

  final Info info;
  final List<Character> characters;

  @override
  List<Object?> get props => [
        [
          info,
          characters,
        ]
      ];
}
