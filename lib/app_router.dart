import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty/constants/strings.dart';
import 'package:rickandmorty/data/models/characters.dart';
import 'package:rickandmorty/data/repostries/character_repostitory.dart';
import 'package:rickandmorty/data/web_services/characters_web_services.dart';
import 'package:rickandmorty/presentation/screen/character_details.dart';
import 'package:rickandmorty/presentation/screen/characters.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
    }
  }
}
