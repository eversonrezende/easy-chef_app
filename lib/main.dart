
import 'package:easy_chef/config/app_settings.dart';
import 'package:easy_chef/config/hive_config.dart';
import 'package:easy_chef/routes.dart';
import 'package:easy_chef/widgets/ingredient_cache.dart';
import 'package:easy_chef/widgets/recipe_cache.dart';
import 'package:easy_chef/widgets/table_cache.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(const MyApp());
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
        ChangeNotifierProvider(create: (context) => AppSettings()),
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
