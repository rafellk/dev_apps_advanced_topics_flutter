import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_view_model.dart';
import 'package:pokedex/services/pokemon_service.dart';

abstract class BaseCoordinator {
  Widget widget();
}

class PokemonListCoordinator implements BaseCoordinator {

  Widget widget() {
    var viewModel = PokemonListViewModel(service: PokemonServiceImpl());
    return PokemonListPage(viewModel: viewModel);
  }
}