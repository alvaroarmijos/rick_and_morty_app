import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/home/presentation/widgets/widgets.dart';

class CharactersBody extends StatelessWidget {
  const CharactersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is Empty) {
        return const MessageDisplay(
          message: 'There aren\'t characters.',
        );
      } else if (state is Loading) {
        return const LoadingWidget();
      } else if (state is Loaded) {
        return CharactersList(
          characters: state.results.characters,
          next: state.results.info.next,
          prev: state.results.info.prev,
        );
      } else if (state is Error) {
        return MessageDisplay(
          message: state.message,
        );
      }

      return Container();
    });
  }
}
