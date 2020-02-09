import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokemon_service.dart';

class PokemonDetail extends StatefulWidget {
  final AllPokemonReponse model;
  PokemonService service = PokemonServiceImpl();

  PokemonDetail([this.model, this.service]);

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  PokemonReponse pokemonResponseModel;

  @override
  void initState() {
    super.initState();
    _fetchPokemonWithName();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.model.name),
        ),
        child: pokemonResponseModel != null
            ? Padding(
                padding: EdgeInsets.only(top: 100, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(widget.service
                        .imageNameForID(id: "${pokemonResponseModel.id}")),
                    Text("ID: ${pokemonResponseModel.id}"),
                    Text("Name: ${pokemonResponseModel.name}"),
                    Text("Height: ${pokemonResponseModel.height}"),
                    Text("Weight: ${pokemonResponseModel.weight}"),
                  ],
                ))
            : Container(
                child: Center(
                  child: CupertinoActivityIndicator(
                    animating: true,
                  ),
                ),
              ));
  }

  _fetchPokemonWithName() {
    widget.service
        .fetchPokemonWithName(name: widget.model.name)
        .then((response) {
      var json = jsonDecode(response.body);
      var model = PokemonReponse.fromMappedJson(json);

      setState(() {
        pokemonResponseModel = model;
      });
    });
  }
}

class PokemonReponse {
  String name;
  int baseExperience;
  int height;
  int weight;
  int id;

  PokemonReponse.fromMappedJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        baseExperience = json['base_experience'] ?? 0,
        height = json['height'] ?? 0,
        weight = json['weight'] ?? 0,
        id = json['id'] ?? 0;
}
