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
          padding: const EdgeInsets.all(5.0),
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
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color:
                                  const Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
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
                                          padding: const EdgeInsets.only(
                                              left: 15,
                                              top: 15,
                                              right: 5,
                                              bottom: 5),
                                          child: SizedBox(
                                            width: 90,
                                            height: 26,
                                            child: Text(
                                              cache.list[index].name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 6, top: 5),
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: Icon(
                                              cache.list[index].isFree
                                                  ? Icons.check
                                                  : Icons.not_interested,
                                              color: cache.list[index].isFree
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, bottom: 5),
                                      child: Text(
                                        'Código: ${cache.list[index].code}',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                0xFF, 0x6C, 0x75, 0x7D),
                                            fontSize: 12),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        'Ocupada:  ${cache.list[index].isFree ? "Sim" : "Não"}',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                0xFF, 0x6C, 0x75, 0x7D),
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            //cache.tables[index].isFree = !cache.tables[index].isFree;
                                            cache.remove(index);
                                          });
                                        },
                                        icon: const Icon(Icons.edit),
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
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
                  leading: Image.asset('assets/images/table-icon.png'),
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
                  leading: Image.asset('assets/images/recipes-icon.png'),
                  title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text('Receitas'),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouterGenerator.recipesScreen);
                  },
                ),
                ListTile(
                  textColor: Colors.white,
                  leading: Image.asset('assets/images/ingredient-icon.png'),
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
