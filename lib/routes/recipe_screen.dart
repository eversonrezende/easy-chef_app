import 'package:flutter/material.dart';
import '../models/form_add_recipe.dart';
import '../routes.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset('assets/images/easy-chef-logo.png'),
            ),
            const Text('Easy Chef'),
          ],
        ),
        backgroundColor: const Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
      ),
      body: ListView(
        children: [
          Container(
            width: 500,
            height: 700,
            decoration: const BoxDecoration(
              color: Colors.black12,
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  repeat: ImageRepeat.repeat),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      'Receitas',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  FormAddRecipe(),
                  FormAddRecipe(),
                  FormAddRecipe()
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: SizedBox(
        width: 280,
        child: Drawer(
          child: Container(
            color: const Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 20,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
                    ),
                    child: Text(''),
                  ),
                ),
                ListTile(
                  textColor: Colors.white,
                  leading:
                      Image.asset('assets/images/table-icon.png'),
                  title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text('Mesas'),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouterGenerator.tablesScreen);
                  },
                ),
                ListTile(
                  textColor: Colors.white,
                  leading: Image.asset(
                      'assets/images/recipes-icon.png'),
                  title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text('Receitas'),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouterGenerator.recipeScreen);
                  },
                ),
                ListTile(
                  textColor: Colors.white,
                  leading:
                      Image.asset('assets/images/ingredient-icon.png'),
                  title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text('Ingredientes'),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouterGenerator.ingredientsScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
