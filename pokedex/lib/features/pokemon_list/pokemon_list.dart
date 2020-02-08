import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_cell.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokemon_service.dart';

// https://pokeapi.co
class PokemonListPage extends StatefulWidget {
  PokemonService service = PokemonServiceImpl();

  PokemonListPage([this.service]);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  List<AllPokemonReponse> dataSource = [];

  @override
  initState() {
    super.initState();
    _feedDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("POKÉDEX"),
          backgroundColor: Color(0xffFAF1AC),
        ),
        child: Container(
            color: Color(0xffFAF1AC),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: dataSource.isNotEmpty
                  ? ListView(
                      children: dataSource.map((pokemon) {
                        return Container(
                            height: 50,
                            child: PokemonListPageCell(
                              model: pokemon,
                            ));
                      }).toList(),
                    )
                  : Container(),
            )));
  }

  _feedDataSource() {
    widget.service.fetchAllKantoPokemon().then((response) {
      var json = jsonDecode(response.body);
      List<AllPokemonReponse> pokemonList = [];
      var list = json["results"];

      if (list != null) {
        for (var pokemonJson in list) {
          var pokemonResponse = AllPokemonReponse.fromMappedJson(pokemonJson);

          if (pokemonJson["url"] != null) {
            var split = pokemonJson["url"].toString().split("/");
            split.removeLast();

            var id = split.last;
            pokemonResponse.imageName = widget.service.imageNameForID(id: id);
          }

          pokemonList.add(pokemonResponse);
        }

        setState(() {
          dataSource = pokemonList;
        });
      }
    });
  }
}
