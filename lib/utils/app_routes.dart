import 'package:cozinha_receitas/screens/categories_meals_screen.dart';
import 'package:cozinha_receitas/screens/categories_screen.dart';
import 'package:cozinha_receitas/screens/meal_detail_screen.dart';
import 'package:cozinha_receitas/screens/settings_screen.dart';
import 'package:cozinha_receitas/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const HOME = '/';
  static const CATEGORY_MEALS = '/categories-meals';
  static const MEAL_DETAIL = '/meal-detail';
  static const SETTINGS = '/settings';

  Map<String, WidgetBuilder> get routes {
    return {
      HOME: (ctx) => TabsScreen(),
      CATEGORY_MEALS: (ctx) => CategoriesMealsScreen(),
      MEAL_DETAIL: (ctx) => MealDetailScreen(),
      SETTINGS: (ctx) => SettingsScreen(),
    };
  }
}
