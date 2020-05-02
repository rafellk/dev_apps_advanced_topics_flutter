import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokemon_service.dart';

class PokemonListViewModel {
  // externalized variables
  List<AllPokemonReponse> dataSource = [];
  String navigationTitle = "POKÉDEX";

  final PokemonService service;
  Function didUpdate;

  PokemonListViewModel({this.service});

  feedDataSource() {
    service.fetchAllKantoPokemon().then((json) {
      List<AllPokemonReponse> pokemonList = [];
      var list = json["results"];

      if (list != null) {
        for (var pokemonJson in list) {
          var pokemonResponse = AllPokemonReponse.fromMappedJson(pokemonJson);

          if (pokemonJson["url"] != null) {
            var id = extractID(pokemonJson["url"]);
            pokemonResponse.imageName = service.imageNameForID(id: id);
          }

          pokemonResponse.name = toUpperCase(pokemonResponse.name);
          pokemonList.add(pokemonResponse);
        }

        dataSource = pokemonList;
        didUpdate();
      }
    }).catchError((error) {
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
}
