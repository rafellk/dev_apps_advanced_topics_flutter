import 'package:http/http.dart' as http;

class Service {
  static Future<http.Response> getCategories() async {
    return http.get(
        "https://raw.githubusercontent.com/rafellk/dev_apps_advanced_topics_flutter/master/DEVAPPS2019.1/delivery_app/resources/network/categories.json");
  }
}
