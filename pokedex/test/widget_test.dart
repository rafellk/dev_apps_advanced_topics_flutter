import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/features/onboarding/onboarding.dart';

void main() {
  // group("Onboarding widget tests", () {
  //   testWidgets(
  //       'Navigate to Onboarding second page and land back on the first page',
  //       (WidgetTester tester) async {
  //     var onboardingPage = OnboardingPage();

  //     await tester.pumpWidget(CupertinoApp(home: onboardingPage));
  //     expect(find.text("Got catch them all"), findsOneWidget);

  //     var element = find.byKey(Key("onboarding_page_view"));
  //     await tester.drag(element, Offset(-500, 0));
  //     await tester.pump();

  //     expect(find.text("All Pokémon"), findsOneWidget);

  //     await tester.drag(element, Offset(500, 0));
  //     await tester.pump();

  //     expect(find.text("Got catch them all"), findsOneWidget);
  //   });

  //   testWidgets('Reaches the last onboarding page',
  //       (WidgetTester tester) async {
  //     var onboardingPage = OnboardingPage();
  //     await tester.pumpWidget(CupertinoApp(home: onboardingPage));

  //     var element = find.byKey(Key("onboarding_page_view"));
  //     await tester.drag(element, Offset(-500, 0));
  //     await tester.drag(element, Offset(-500, 0));
  //     await tester.drag(element, Offset(-500, 0));

  //     expect(find.byKey(Key("button")), findsOneWidget);
  //   });
  // });
}
