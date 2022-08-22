import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/global/styles.dart';
import 'package:rick_and_morty_app/features/home/presentation/bloc/home/home_bloc.dart';

class ModalBottomSheetGender extends StatelessWidget {
  const ModalBottomSheetGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Filter by:',
            style: TitleStyle(),
          ),
          ListTile(
            title: const Text('All'),
            onTap: () {
              bloc.add(const InitCharacters());
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Female'),
            onTap: () {
              bloc.add(const InitCharactersGender(gender: 'female'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Male'),
            onTap: () {
              bloc.add(const InitCharactersGender(gender: 'male'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Genderless'),
            onTap: () {
              bloc.add(const InitCharactersGender(gender: 'genderless'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Unknown'),
            onTap: () {
              bloc.add(const InitCharactersGender(gender: 'unknown'));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
