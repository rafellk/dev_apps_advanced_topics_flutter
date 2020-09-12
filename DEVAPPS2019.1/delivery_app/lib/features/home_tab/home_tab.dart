import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:delivery_app/features/categories_page/categories_page.dart';
import 'package:delivery_app/features/categories_page/categories_view_model.dart';
import 'package:delivery_app/services/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_on, color: AppColors.textSecondaryColor),
              activeIcon:
                  Icon(Icons.grid_on, color: AppColors.tabIconSelectedColor)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,
                  color: AppColors.textSecondaryColor),
              activeIcon:
                  Icon(Icons.person, color: AppColors.tabIconSelectedColor)),
        ]),
        tabBuilder: (context, index) {
          return CategoriesPage(
            viewModel: CategoriesViewModel(service: Service()),
          );
        });
  }
}
