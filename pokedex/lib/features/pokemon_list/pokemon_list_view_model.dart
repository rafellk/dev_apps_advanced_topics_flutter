import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokemon_service.dart';

enum PokemonListState { feededDatasource, error, loading }

class PokemonListViewModel {
  // externalized variables
  List<AllPokemonReponse> dataSource = [];
  String navigationTitle = "POKÉDEX";
  PokemonListState state;

  final PokemonService service;
  Function didUpdate;

  PokemonListViewModel({this.service});

  Future feedDataSource() async {
    state = PokemonListState.loading;
    _updateIfNeeded();

    return service.fetchAllKantoPokemon().then((json) {
      List<AllPokemonReponse> pokemonList = [];
      var list = json["results"];

      if (list != null) {
        for (var pokemonJson in list) {
          var pokemonResponse = AllPokemonReponse.fromMappedJson(pokemonJson);

          if (pokemonJson["url"] != null) {
            var id = extractID(pokemonJson["url"]);
            pokemonResponse.imageName = service.imageNameForID(id: id);
          }

          pokemonList.add(pokemonResponse);
        }

        dataSource = pokemonList;
        state = PokemonListState.feededDatasource;
        _updateIfNeeded();
      }
    }).catchError((error) {
      state = PokemonListState.error;
      _updateIfNeeded();
      print(error);
    });
  }

  String toUpperCase(String value) {
    if (value == null) {
      return "null";
    }

    return value.toUpperCase();
  }

  String extractID(String url) {
    if (!url.contains("/")) {
      return "error";
    }

    var split = url.toString().split("/");
    split.removeLast();
    return split.last;
  }

  void _updateIfNeeded() {
    if (didUpdate != null) {
      didUpdate();
    }
  }
}
