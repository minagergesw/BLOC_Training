import 'package:bloc/bloc.dart';
import 'package:dloc_training/Data/Models/Character.dart';
import 'package:dloc_training/Data/Repository/Characters_Repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
   List<Character> characters=[];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getCharacters() {
    charactersRepository.getCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
