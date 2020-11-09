import 'package:delivery_app/features/categories_page/categories_page.dart';
import 'package:delivery_app/features/categories_page/categories_view_model.dart';
import 'package:delivery_app/features/splash/splash_screen.dart';
import 'package:delivery_app/features/splash/splash_view_model.dart';
import 'package:delivery_app/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Splash screen', (WidgetTester tester) async {
    var viewModel = SplashViewModel();
    var splash = SplashScreen(viewModel: viewModel);

    await tester.pumpWidget(MaterialApp(home: splash));
    expect(find.byKey(Key("logo")), findsOneWidget);

    expect(find.byKey(Key("orderNowButton")), findsOneWidget);
  });

  testWidgets('Categories to Vegetables', (WidgetTester tester) async {
    var service = Service();
    var viewModel = CategoriesViewModel(service: service);

    var widget = CategoriesPage(viewModel: viewModel);
    await tester.pumpWidget(MaterialApp(
      home: widget,
    ));

    expect(find.text("Search"), findsOneWidget);
    expect(find.text("Categories"), findsOneWidget);
  });
}
