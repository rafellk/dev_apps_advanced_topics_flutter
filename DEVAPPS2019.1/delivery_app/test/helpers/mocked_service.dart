import 'dart:convert';

import 'package:delivery_app/services/service.dart';
import 'package:http/src/response.dart';

enum MockType {
  badRequestError, // 400
  internalServerError, // 500
  unauthorizedError, // 403
  filled,
  empty
}

class MockedService implements ServiceInterface {
  MockType type;

  MockedService({this.type});

  Future<Response> getCategories() {
    switch (type) {
      case MockType.badRequestError:
        return Future.error(400);
      case MockType.internalServerError:
        return Future.error(500);
      case MockType.unauthorizedError:
        return Future.error(403);
      case MockType.filled:
        return _mockFilledType();
      case MockType.empty:
        return _mockEmptyType();
    }
  }

  Future<Response> _mockFilledType() {
    Future<Response> future = Future<Response>(() {
      Map<String, dynamic> json = {
        "categories": [
          {
            "title": "Vegetables Mocked",
            "imageURL":
                "https://homepages.cae.wisc.edu/~ece533/images/barbara.png",
            "items": [
              {
                "title": "Boston Lettuce Mocked",
                "imageURL":
                    "https://homepages.cae.wisc.edu/~ece533/images/peppers.png",
                "price": 1.10,
                "unit": "kg"
              }
            ]
          },
        ]
      };

      var body = jsonEncode(json);
      return Response(body, 200);
    });

    return future;
  }

  Future<Response> _mockEmptyType() {
    Future<Response> future = Future<Response>(() {
      Map<String, dynamic> json = {"categories": []};

      var body = jsonEncode(json);
      return Response(body, 200);
    });

    return future;
  }
}
