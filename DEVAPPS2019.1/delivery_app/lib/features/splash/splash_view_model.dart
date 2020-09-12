abstract class SplashViewModelInteface {
  String defaultBackgroundImage;
  String logoImage;
  String splashIconImage;
  String title;
  String description;
  String orderNowButtonTitle;
  String dismissButtonTitle;
}

class SplashViewModel implements SplashViewModelInteface {
  String defaultBackgroundImage = "resources/images/splash_background.png";
  String logoImage = "resources/images/logo.png";
  String splashIconImage = "resources/images/splash_icon.png";
  String title = "Non-Contact Deliveries";
  String description =
      "When placing an order, select the option Contactless delivery and the courier will leave your order at the door";
  String orderNowButtonTitle = "ORDER NOW";
  String dismissButtonTitle = "DISMISS";
}