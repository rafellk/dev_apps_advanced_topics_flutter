import 'package:http/http.dart';
import 'package:pokedex/services/pokemon_service.dart';

enum MockedState { success, error }

class MockedPokemonService implements PokemonService {
  MockedState state;

  MockedPokemonService({this.state = MockedState.success});

  @override
  Future fetchAllKantoPokemon() {
    switch (state) {
      case MockedState.success:
        return _fetchAllPokemonWithSuccess();
        break;
      case MockedState.error:
        return _fetchAllPokemonWithError();
        break;
    }

    return null;
  }

  @override
  Future<Response> fetchPokemonWithName({String name}) {
    throw UnimplementedError();
  }

  @override
  String imageNameForID({String id}) {
    return id;
  }

  Future _fetchAllPokemonWithSuccess() {
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

  _fetchAllPokemonWithError() {
    return Future.error("404");
  }
}
