import 'package:delivery_app/features/splash/splash_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("View model", () {
    test("Initial values", () {
      var viewModel = SplashViewModel();
      expect(viewModel.defaultBackgroundImage,
          "resources/images/splash_background.png");
      expect(viewModel.logoImage, "resources/images/logo.png");
      expect(viewModel.splashIconImage, "resources/images/splash_icon.png");
      expect(viewModel.title, "Non-Contact Deliveries");
      expect(viewModel.description,
          "When placing an order, select the option Contactless delivery and the courier will leave your order at the door");
      expect(viewModel.orderNowButtonTitle, "ORDER NOW");
      expect(viewModel.dismissButtonTitle, "DISMISS");
    });
  });
}
