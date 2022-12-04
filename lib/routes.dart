import 'package:easy_chef/routes/ingredients_screen.dart';
import 'package:easy_chef/routes/login.dart';
import 'package:easy_chef/routes/recipe_screen.dart';
import 'package:easy_chef/routes/tables_screen.dart';
import 'package:flutter/material.dart';
import 'models/form_add_ingredients.dart';
import 'models/form_add_recipe.dart';
import 'models/form_add_table.dart';

class RouterGenerator {
  static const String login = '/login';
  static const String ingredientsScreen = '/ingredients';
  static const String recipeScreen = '/recipes';
  static const String tablesScreen = '/tables';
  static const String formAddTable = '/add-table';
  static const String formAddRecipe = '/add-recipe';
  static const String formAddIngredient = '/add-ingredient';


  RouterGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case ingredientsScreen:
        return MaterialPageRoute(
          builder: (_) => const IngredientsScreen(),
        );
      case recipeScreen:
        return MaterialPageRoute(
          builder: (_) => const RecipesScreen(),
        );
      case tablesScreen:
        return MaterialPageRoute(
          builder: (_) => const TablesScreen(),
        );
      case formAddTable:
        return MaterialPageRoute(
          builder: (_) => const FormAddTable(),
        );
      case formAddRecipe:
        return MaterialPageRoute(
          builder: (_) => const FormAddRecipe(),
        );
      case formAddIngredient:
        return MaterialPageRoute(
          builder: (_) => const FormAddIngredients(),
        );
      default:
        throw const FormatException(
          "Rota não encontrada",
        );
    }
  }
}
