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

  test('Full validation', () async {
    var orderNowButton = find.byValueKey("orderNowButton");

    WaitFor(orderNowButton);
    await driver.tap(orderNowButton);

    var vegetablesItem = find.byValueKey("Vegetables");
    WaitFor(vegetablesItem);

    await driver.tap(vegetablesItem);

    var shoppingCartButton = find.byValueKey("shoppingCart");
    WaitFor(shoppingCartButton);

    await driver.tap(shoppingCartButton);
  });
}
