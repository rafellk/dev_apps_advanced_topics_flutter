import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  test('Go through onboarding and land on pokemon list page', () async {
    var onboardingPage = find.byValueKey("onboarding_page_view");
    WaitFor(onboardingPage);

    await driver.scroll(onboardingPage, -300, 0, Duration(milliseconds: 500));
    await driver.scroll(onboardingPage, -300, 0, Duration(milliseconds: 500));
    await driver.scroll(onboardingPage, -300, 0, Duration(milliseconds: 500));

    var button = find.byValueKey("button");
    WaitFor(button);

    await driver.tap(button);
    WaitFor(find.text("POKÉDEX"));
  });
}
