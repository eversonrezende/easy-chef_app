import 'package:easy_chef/routes/form_table.dart';
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
  static const String formTable = '/add_table';

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
      case formTable:
        return MaterialPageRoute(
          builder: (_) => const FormTable(),
        );
      /*case formAddRecipe:
        return MaterialPageRoute(
          builder: (_) => const FormAddRecipe(),
        );*/
      /*case formAddIngredient:
        return MaterialPageRoute(
          builder: (_) => const FormAddIngredients(),
        );*/
      default:
        throw const FormatException(
          "Rota não encontrada",
        );
    }
  }
}
