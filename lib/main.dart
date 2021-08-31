import 'package:cozinha_receitas/models/settings.dart';
import 'package:cozinha_receitas/screens/categories_meals_screen.dart';
import 'package:cozinha_receitas/screens/categories_screen.dart';
import 'package:cozinha_receitas/screens/meal_detail_screen.dart';
import 'package:cozinha_receitas/screens/settings_screen.dart';
import 'package:cozinha_receitas/screens/tabs_screen.dart';
import 'package:cozinha_receitas/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavoriteMeal(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  Map<String, WidgetBuilder> get _routes {
    return {
      AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
      AppRoutes.CATEGORY_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
      AppRoutes.MEAL_DETAIL: (ctx) =>
          MealDetailScreen(_toggleFavorite, _isFavoriteMeal),
      AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: AppRoutes.HOME,
      routes: _routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return CategoriesScreen();
        });
      },
    );
  }
}
