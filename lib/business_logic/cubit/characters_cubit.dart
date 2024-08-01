import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/data/models/characters.dart';
import 'package:rickandmorty/data/repostries/character_repostitory.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  void getAllCharacters() async {
    try {
      characters = await charactersRepository.getAllCharacters();
      emit(CharactersLoaded(characters));
    } catch (e) {
      emit(CharactersError("Failed to fetch characters"));
    }
  }
}