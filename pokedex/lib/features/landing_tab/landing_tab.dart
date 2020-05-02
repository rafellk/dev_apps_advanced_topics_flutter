import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_grid/pokemon_grid.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_coordinator.dart';

class LandingTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.blueGrey,
          inactiveColor: Colors.grey.withOpacity(0.8),
          activeColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                title: Text("List"), icon: Icon(CupertinoIcons.news)),
            BottomNavigationBarItem(
                title: Text("Grid"), icon: Icon(CupertinoIcons.news)),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                  builder: (BuildContext context) =>
                      PokemonListCoordinator().widget());
          }

          return CupertinoTabView(
              builder: (BuildContext context) => PokemonGridPage());
        });
  }
}
