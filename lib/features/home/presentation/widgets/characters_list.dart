import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/home/domain/entities/entities.dart';
import 'package:rick_and_morty_app/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:rick_and_morty_app/features/home/presentation/widgets/character_card.dart';

class CharactersList extends StatelessWidget {
  final List<Character> characters;
  final String? next;
  final String? prev;
  const CharactersList(
      {Key? key,
      required this.characters,
      required this.next,
      required this.prev})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isUp = false;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is UserScrollNotification) {
            if (scrollNotification.direction == ScrollDirection.forward) {
              isUp = false;
            } else if (scrollNotification.direction ==
                ScrollDirection.reverse) {
              isUp = true;
            }
          }
          if (scrollNotification is ScrollEndNotification) {
            if (scrollNotification.metrics.axisDirection ==
                AxisDirection.down) {
              if (scrollNotification.metrics.pixels ==
                  scrollNotification.metrics.maxScrollExtent) {
                if (isUp) {
                  context.read<HomeBloc>().add(ChangePage(url: next));
                }
              } else if (scrollNotification.metrics.pixels ==
                  scrollNotification.metrics.minScrollExtent) {
                if (!isUp) {
                  context.read<HomeBloc>().add(ChangePage(url: prev));
                }
              }
            }
          }
          return true;
        },
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: characters.length,
          itemBuilder: (context, index) =>
              CharacterCard(character: characters[index]),
        ),
      ),
    );
  }
}
