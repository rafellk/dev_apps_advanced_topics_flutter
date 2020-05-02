import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_cell.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_view_model.dart';

// https://pokeapi.co
class PokemonListPage extends StatefulWidget {
  final PokemonListViewModel viewModel;

  PokemonListPage({this.viewModel});

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  PokemonListViewModel _viewModel;

  @override
  initState() {
    super.initState();
    _viewModel = widget.viewModel;
    _viewModel.didUpdate = () {
      setState(() {});
    };
    _viewModel.feedDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            _viewModel.navigationTitle,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        child: Container(
            color: Colors.blueGrey.withOpacity(_Constants.opacity),
            child: Padding(
                padding: const EdgeInsets.all(_Constants.defaultPadding),
                child: _buildUIForState())));
  }

  Widget _buildUIForState() {
    switch (_viewModel.state) {
      case PokemonListState.feededDatasource:
        return ListView(
            children: _viewModel.dataSource.map((pokemon) {
          return Container(
              height: _Constants.cellHeight,
              child: PokemonListPageCell(
                model: pokemon,
              ));
        }).toList());
        break;
      case PokemonListState.loading:
        return Container(child: Center(child: CupertinoActivityIndicator()));
        break;
      case PokemonListState.error:
        return Container(
            child: Center(child: Text("An error occurred. Try again later!!")));
    }

    return null;
  }
}

class _Constants {
  static const double cellHeight = 50;
  static const double defaultPadding = 8.0;
  static const double opacity = 0.8;
}
