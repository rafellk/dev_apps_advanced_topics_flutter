import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_response.dart';
import 'package:pokedex/services/pokemon_service.dart';
import 'package:transparent_image/transparent_image.dart';

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
          middle: Text(
            widget.model.name.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          actionsForegroundColor: Colors.white,
          backgroundColor: Colors.blueGrey,
        ),
        child: Container(
            color: Colors.blueGrey.withOpacity(0.8),
            child: pokemonResponseModel != null
                ? Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          elevation: 50,
                          color: Color(0xff758A97),
                          child: Container(
                            margin: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Training",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 16),
                                  child: Divider(
                                    color: Colors.white,
                                    height: 0,
                                    thickness: 0.5,
                                  ),
                                ),
                                Text(
                                    "Base Experience: ${pokemonResponseModel.baseExperience}",
                                    style: TextStyle(color: Colors.white)),
                                Text(
                                    "Height: ${pokemonResponseModel.height} kg",
                                    style: TextStyle(color: Colors.white)),
                                Text(
                                    "Weight: ${pokemonResponseModel.weight} kg",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 50,
                          color: Color(0xff758A97),
                          child: Container(
                            margin: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Sprites",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 16),
                                  child: Divider(
                                    color: Colors.white,
                                    height: 0,
                                    thickness: 0.5,
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  child: GridView.count(
                                      physics: NeverScrollableScrollPhysics(),
                                      primary: false,
                                      crossAxisCount: 4,
                                      children: pokemonResponseModel
                                          .spriteImages
                                          .map((sprite) {
                                        return SmoothImageLoader(
                                          imageName: sprite,
                                        );
                                      }).toList()),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Center(
                      child: CupertinoActivityIndicator(
                        animating: true,
                      ),
                    ),
                  )));
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

class SmoothImageLoader extends StatelessWidget {
  double placeholderHeight;
  String imageName;

  SmoothImageLoader({this.placeholderHeight = 50, this.imageName});

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: placeholderHeight,
          width: placeholderHeight,
        ),
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imageName,
        ),
      ],
    );
  }
}
