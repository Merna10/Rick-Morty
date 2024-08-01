import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty/data/repostries/character_repostitory.dart';
import 'package:rickandmorty/data/web_services/characters_web_services.dart';
import 'package:rickandmorty/presentation/screen/characters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CharactersRepository charactersRepository = CharactersRepository(CharacterWebServices());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharactersCubit(charactersRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Rick and Morty',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CharactersScreen(),
      ),
    );
  }
}
