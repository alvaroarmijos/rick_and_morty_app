import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/global/styles.dart';
import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: Image.network(character.image)),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: const TitleStyle(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  character.gender,
                  style: const SubtitleStyle(),
                ),
                Text(
                  character.status,
                  style: const SubtitleStyle(),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
