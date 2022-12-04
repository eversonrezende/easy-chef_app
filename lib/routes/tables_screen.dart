import 'package:easy_chef/components/table_component.dart';
import 'package:easy_chef/routes.dart';
import 'package:easy_chef/widgets/table_cache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({Key? key}) : super(key: key);

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
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
      body: Container(
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
            children: [
              const Text(
                "Mesas",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouterGenerator.formTable);
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: 355,
                  child: const Text('Nova Mesa'),
                ),
              ),
              Consumer<TableCache>(
                builder: (context, cache, _) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: cache.list.length,
                      itemBuilder: (context, index) {
                        return TableComponent(
                            name: cache.list[index].name,
                            code: cache.list[index].code,
                            isFree: cache.list[index].isFree);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
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
                        .pushReplacementNamed(RouterGenerator.tablesScreen);
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
