import 'package:dloc_training/Data/API/Characters_API.dart';
import 'package:dloc_training/Data/Models/Character.dart';

class CharactersRepository {
  final CharactersAPI charactersAPI;

  CharactersRepository(this.charactersAPI);

  Future<List<Character>> getCharacters() async {
    final characters = await charactersAPI.getCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
