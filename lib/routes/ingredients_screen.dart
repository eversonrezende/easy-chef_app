import 'package:easy_chef/models/form_add_ingredients.dart';
import 'package:flutter/material.dart';
import '../routes.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({Key? key}) : super(key: key);

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
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
                      'Ingredientes',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  FormAddIngredients(),
                  FormAddIngredients(),
                  FormAddIngredients()
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
                        .pushNamed(RouterGenerator.recipeScreen);
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
                    Navigator.of(context).pushReplacementNamed(
                        RouterGenerator.ingredientsScreen);
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
/*
Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15),
color: const Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
),
height: 100,
width: 380,
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Padding(
padding: const EdgeInsets.only(left: 15, top: 15, right: 5, bottom: 5),
child: SizedBox(
width: 55,
height: 26,
child: Text(
'Mesa',
style: TextStyle(
color: Colors.white, fontSize: 22),
),
),
),
Padding(
padding: const EdgeInsets.only(left: 6, top: 5),
child: SizedBox(
width: 20,
height: 20,
child: Icon(
ocupado ? Icons.check : Icons.not_interested,
color: ocupado ? Colors.green : Colors.red,
),
),
),
],
),
Padding(
padding: const EdgeInsets.only(left: 15, bottom: 5),
child: Container(
child: Text(
'Código: $codigo',
style: const TextStyle(
color: Color.fromARGB(0xFF, 0x6C, 0x75, 0x7D),
fontSize: 12),
),
),
),
Padding(
padding: const EdgeInsets.only(left: 15),
child: Text(
'Ocupada:  ${ocupado ? "Sim" : "Não"}',
style: const TextStyle(
color: Color.fromARGB(0xFF, 0x6C, 0x75, 0x7D),
fontSize: 12),
),
),
],
),
IconButton(
style: const ButtonStyle(),
color: Colors.white,
onPressed: () {
setState(() {
ocupado = !ocupado;
codigo++;
});
},
icon: const Icon(Icons.edit),
tooltip: 'Alterar status da mesa',
)
],
),
)*/
