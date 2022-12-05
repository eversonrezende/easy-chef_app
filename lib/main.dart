import 'package:easy_chef/models/ingredient_model.dart';
import 'package:easy_chef/models/ingredients_model.dart';
import 'package:easy_chef/models/recipes_model.dart';
import 'package:easy_chef/models/tables_model.dart';
import 'package:easy_chef/routes.dart';
import 'package:easy_chef/routes/ingredients_screen.dart';
import 'package:easy_chef/routes/login_screen.dart';
import 'package:easy_chef/routes/recipes_screen.dart';
import 'package:easy_chef/routes/tables_screen.dart';
import 'package:easy_chef/widgets/ingredient_cache.dart';
import 'package:easy_chef/widgets/recipe_cache.dart';
import 'package:easy_chef/widgets/table_cache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TablesModel(tables: [])),
      ChangeNotifierProvider(create: (context) => RecipesModel(recipes: [])),
      ChangeNotifierProvider(create: (context) => IngredientsModel(ingredients: [])),
    ],
    child: MyApp(),
  ));
}*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TableCache()),
        ChangeNotifierProvider(create: (context) => RecipeCache()),
        ChangeNotifierProvider(create: (context) => IngredientCache()),
      ],
      child: MaterialApp(
        onGenerateTitle: (context) => "EasyChef",
        initialRoute: RouterGenerator.login,
        onGenerateRoute: RouterGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
/*
  @override
  Widget build(BuildContext context) {
    return Provider<TableCache>(
        create: (_) => TableCache(),
    child: MaterialApp(
      onGenerateTitle: (context) => "EasyChef",
      initialRoute: RouterGenerator.login,
      onGenerateRoute: RouterGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    ),);


  }
}*/
