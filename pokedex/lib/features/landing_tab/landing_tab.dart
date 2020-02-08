import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_grid/pokemon_grid.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list.dart';
import 'package:pokedex/services/pokemon_service.dart';

class LandingTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Color(0xffF9EFA8),
          inactiveColor: Colors.grey,
          activeColor: Colors.black87,
          items: [
            BottomNavigationBarItem(
                title: Text("List"), icon: Icon(CupertinoIcons.news)),
            BottomNavigationBarItem(
                title: Text("Grid"), icon: Icon(CupertinoIcons.news)),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                  builder: (BuildContext context) =>
                      PokemonListPage(PokemonServiceImpl()));
            case 1:
              return CupertinoTabView(
                  builder: (BuildContext context) => PokemonGridPage());
          }
        });
  }
}
