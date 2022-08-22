import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:rick_and_morty_app/features/home/presentation/widgets/modal_bottom_sheet_gender.dart';
import 'package:rick_and_morty_app/features/home/presentation/widgets/widgets.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const InitCharacters());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick And Morty'),
        actions: [
          IconButton(
              onPressed: _showModalBottomSheet,
              icon: const Icon(Icons.filter_list)),
        ],
      ),
      body: const CharactersBody(),
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => const ModalBottomSheetGender());
  }
}
