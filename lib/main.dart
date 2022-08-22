import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:rick_and_morty_app/features/home/presentation/pages/characters_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<HomeBloc>()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick and Morty',
          home: CharactersPage(),
        ));
  }
}
