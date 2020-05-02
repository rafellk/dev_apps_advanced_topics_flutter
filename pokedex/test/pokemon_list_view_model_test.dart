import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_view_model.dart';
import 'package:pokedex/services/pokemon_service.dart';

import 'helper/services/mocked_pokemon_service.dart';

void main() {
  PokemonListViewModel viewModel;
  PokemonService service;

  setUpAll(() {
    service = PokemonServiceImpl();
    viewModel = PokemonListViewModel(service: service);
  });

  tearDownAll(() {
    service = null;
    viewModel = null;
  });

  test('Empty state', () {
    expect(viewModel.dataSource.isEmpty, true);
    expect(viewModel.navigationTitle, "POKÉDEX");
    expect(viewModel.didUpdate, null);
    expect(viewModel.service, service);
  });

  test('Upper case emtpy string', () {
    String lowercasedString = "";
    expect(viewModel.toUpperCase(lowercasedString), "");
  });

  test('Upper case lowercased string', () {
    String lowercasedString = "lowercased";
    expect(viewModel.toUpperCase(lowercasedString), "LOWERCASED");
  });

  test('Upper case uppercased string', () {
    String uppercasedString = "UPPERCASED";
    expect(viewModel.toUpperCase(uppercasedString), uppercasedString);
  });

  test('Upper case null string', () {
    String nullString;
    expect(viewModel.toUpperCase(nullString), "null");
  });

  test('Extract id from correct url', () {
    var url = "www.google.com/pokemon/1/png";
    expect(viewModel.extractID(url), "1");
  });

  test('Extract id from incorrect url', () {
    var url = "incorrect url";
    expect(viewModel.extractID(url), "error");
  });

  test('Feed data source with real network', () async {
    viewModel.feedDataSource();
    await Future.delayed(Duration(seconds: 2)).then((value) {
      expect(viewModel.dataSource.length, 151);
    });
  });

  test('Feed data source with mocked network', () async {
    viewModel = PokemonListViewModel(service: MockedPokemonService());
    viewModel.feedDataSource();

    await Future.delayed(Duration(seconds: 2)).then((value) {
      expect(viewModel.dataSource.length, 5);
    });
  });
}
