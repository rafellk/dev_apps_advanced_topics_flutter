import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/landing_tab/landing_tab.dart';
import 'package:pokedex/features/onboarding/onboarding_page_child.dart';

class OnboardingPage extends StatelessWidget {
  final PageController controller = PageController();
  List<Widget> dataSource = [];

  OnboardingPage() {
    dataSource = [
      OnboardingPageChild(
          model: OnboardingPageChildModel(
        mainTitle: "Got catch them all",
        secondaryTitle: "Welcome to the Pokédex App",
        imageName: "resources/images/bulbasaur.png",
        shouldPresentButton: false,
      )),
      OnboardingPageChild(
          model: OnboardingPageChildModel(
        mainTitle: "All Pokémon",
        secondaryTitle: "Check all Pokémon from every region",
        imageName: "resources/images/charmander.png",
        shouldPresentButton: false,
      )),
      OnboardingPageChild(
          model: OnboardingPageChildModel(
        mainTitle: "Detailed information",
        secondaryTitle: "Check the specific info about them",
        imageName: "resources/images/squirtle.png",
        shouldPresentButton: false,
      )),
      OnboardingPageChild(
          model: OnboardingPageChildModel(
              mainTitle: "Pokédex App",
              secondaryTitle: "The best Pokédex App ever",
              imageName: "resources/images/pokedex.png",
              shouldPresentButton: true,
              buttonTitle: "Get Start Now!!!",
              onButtonPressed: (context) {
                _presentPokemonListPage(context: context);
              })),
    ];
  }

  _presentPokemonListPage({BuildContext context}) {
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (context) => LandingTabPage()));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: PageView(
      key: Key("onboarding_page_view"),
      children: dataSource,
    ));
  }
}
