import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_detail/pokemon_detail.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokemon_service.dart';

class PokemonListPageCell extends StatelessWidget {
  final AllPokemonReponse model;

  PokemonListPageCell({this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => PokemonDetail(model, PokemonServiceImpl())));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(model.imageName),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(model.name),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                CupertinoIcons.right_chevron,
                color: Colors.black54,
              )
            ],
          )
        ],
      ),
    );
  }
}
