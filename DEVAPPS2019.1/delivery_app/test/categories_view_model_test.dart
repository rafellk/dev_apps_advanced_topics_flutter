import 'package:delivery_app/features/categories_page/categories_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/mocked_service.dart';

void main() {
  test("Initial values", () {
    var service = MockedService();
    var viewModel = CategoriesViewModel(service: service);

    expect(viewModel.didUpdate, null);
    expect(viewModel.service, service);

    expect(viewModel.adapter.title, "Categories");
    expect(viewModel.adapter.isLoading, false);
    
    expect(viewModel.adapter.categories, []);
    expect(viewModel.adapter.inError, false);
  });

  test("Is in Loading State", () async {
    var service = MockedService(type: MockType.filled);
    var viewModel = CategoriesViewModel(service: service);

    var counter = 0; // quantity of times `adapter.isLoading` is TRUE
    viewModel.didUpdate = (adapter) {
      if (adapter.isLoading) {
        counter++;
      }
    };

    viewModel.fetchCategories();
    expect(counter, 1);
  });

  test("Is not in Loading State", () async {
    var service = MockedService(type: MockType.filled);
    var viewModel = CategoriesViewModel(service: service);

    var counter = 0; // quantity of times `adapter.isLoading` is FALSE
    viewModel.didUpdate = (adapter) {
      if (!adapter.isLoading) {
        counter++;
      }
    };

    await viewModel.fetchCategories();
    expect(counter, 1);
  });

  test("Categories for `filled` state without `didUpdate`", () async {
    var service = MockedService(type: MockType.filled);
    var viewModel = CategoriesViewModel(service: service);

    await viewModel.fetchCategories();
    expect(viewModel.adapter.categories.length, 1);
  });

  test("Categories for `filled` state with `didUpdate`", () async {
    var service = MockedService(type: MockType.filled);
    var viewModel = CategoriesViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.categories.isNotEmpty) {
        counter++;
      }
    };

    await viewModel.fetchCategories();
    expect(counter, 1);
  });

  test("Categories for `filled` state multiple times with `didUpdate`",
      () async {
    var service = MockedService(type: MockType.filled);
    var viewModel = CategoriesViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.categories.isNotEmpty) {
        counter++;
      }
    };

    await viewModel.fetchCategories();
    expect(counter, 1);

    await viewModel.fetchCategories();
    expect(counter, 3);
  });

  test("Categories for `empty` state without `didUpdate`", () async {
    var service = MockedService(type: MockType.empty);
    var viewModel = CategoriesViewModel(service: service);

    await viewModel.fetchCategories();
    expect(viewModel.adapter.categories.length, 0);
  });

  test("Categories for `empty` state with `didUpdate`", () async {
    var service = MockedService(type: MockType.empty);
    var viewModel = CategoriesViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.categories.isEmpty) {
        counter++;
      }
    };

    await viewModel.fetchCategories();
    expect(counter, 2);
  });

  test("Categories for `empty` state multiple times with `didUpdate`",
      () async {
    var service = MockedService(type: MockType.empty);
    var viewModel = CategoriesViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.categories.isEmpty) {
        counter++;
      }
    };

    await viewModel.fetchCategories();
    expect(counter, 2);

    await viewModel.fetchCategories();
    expect(counter, 4);
  });

  test("Bad Request error", () async {
    var service = MockedService(type: MockType.badRequestError);
    var viewModel = CategoriesViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.inError) {
        counter++;
      }
    };

    await viewModel.fetchCategories();
    expect(counter, 1);
  });

  test("Internal Server error", () async {
    var service = MockedService(type: MockType.internalServerError);
    var viewModel = CategoriesViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.inError) {
        counter++;
      }
    };

    await viewModel.fetchCategories();
    expect(counter, 1);
  });

  test("Unauthorized error", () async {
    var service = MockedService(type: MockType.unauthorizedError);
    var viewModel = CategoriesViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.inError) {
        counter++;
      }
    };

    await viewModel.fetchCategories();
    expect(counter, 1);
  });
}
