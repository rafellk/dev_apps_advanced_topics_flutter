import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseService {
  String baseURL = "https://pokeapi.co/api/v2";

  String formURL(String endpoint) {
    return "$baseURL$endpoint";
  }
}

abstract class PokemonService {
  Future<dynamic> fetchAllKantoPokemon();
  Future<http.Response> fetchPokemonWithName({String name});
  String imageNameForID({String id});
}

class PokemonServiceImpl extends BaseService implements PokemonService {
  @override
  Future<dynamic> fetchAllKantoPokemon() async {
    return Future<dynamic>(() async {
      var json;

      await http.get(formURL("/pokemon?limit=151")).then((response) {
        json = jsonDecode(response.body);
      }).catchError((error) {
        throw error;
      });

      return json;
    });
  }

  @override
  String imageNameForID({String id}) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
  }

  @override
  Future<http.Response> fetchPokemonWithName({String name}) {
    return http.get(formURL("/pokemon/$name/"));
  }
}
