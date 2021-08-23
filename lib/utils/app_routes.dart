import 'package:cozinha_receitas/screens/categories_meals_screen.dart';
import 'package:cozinha_receitas/screens/categories_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const HOME = '/';
  static const CATEGORY_MEALS = '/categories-meals';

  Map<String, WidgetBuilder> get routes {
    return {
      HOME: (ctx) => CategoriesScreen(),
      CATEGORY_MEALS: (ctx) => CategoriesMealsScreen(),
    };
  }
}
