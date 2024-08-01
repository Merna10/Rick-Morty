part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  CharactersLoaded(this.characters);
}

class CharactersError extends CharactersState {
  final String message;
  CharactersError(this.message);
}
