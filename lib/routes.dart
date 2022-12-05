import 'package:easy_chef/routes/ingredients_screen.dart';
import 'package:easy_chef/routes/login_screen.dart';
import 'package:easy_chef/routes/recipes_screen.dart';
import 'package:easy_chef/routes/tables_screen.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static const String login = '/';
  static const String ingredientsScreen = '/ingredients';
  static const String recipesScreen = '/recipes';
  static const String tablesScreen = '/tables';

  RouterGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case ingredientsScreen:
        return MaterialPageRoute(
          builder: (_) => const IngredientsScreen(),
        );
      case recipesScreen:
        return MaterialPageRoute(
          builder: (_) => const RecipesScreen(),
        );
      case tablesScreen:
        return MaterialPageRoute(
          builder: (_) => const TablesScreen(),
        );
      default:
        throw const FormatException(
          "Rota não encontrada",
        );
    }
  }
}
