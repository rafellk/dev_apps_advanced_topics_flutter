import 'package:http/http.dart';
import 'package:pokedex/services/pokemon_service.dart';

class MockedPokemonService implements PokemonService {
  @override
  Future fetchAllKantoPokemon() {
    Future<dynamic> future = Future<dynamic>(() {
      var list = [
        {"name": "Bulbasaur", "url": "bulba test"},
        {"name": "Bulbasaur", "url": "bulba test"},
        {"name": "Bulbasaur", "url": "bulba test"},
        {"name": "Bulbasaur", "url": "bulba test"},
        {"name": "Bulbasaur", "url": "bulba test"},
      ];

      Map<String, dynamic> json = {"results": list};
      return json;
    });

    return future;
  }

  @override
  Future<Response> fetchPokemonWithName({String name}) {
    throw UnimplementedError();
  }

  @override
  String imageNameForID({String id}) {
    return id;
  }
}
