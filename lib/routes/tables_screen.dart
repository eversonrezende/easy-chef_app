import 'dart:convert';

import 'package:easy_chef/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TablesScreen extends StatefulWidget {
  const TablesScreen({Key? key}) : super(key: key);

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  List tables = [];

  Future<List> showAllTables() async {
    await Future.delayed(const Duration(seconds: 1));

    final response = await http
        .get(Uri.parse('https://servidor.easychef.click/api/Mesa/All'));

    tables = json.decode(response.body) as List;

    return tables;
  }

  //CONFERIR SE URL PARA CRIAR É ASSIM
  Future<http.Response> createTables(String nome, bool ocupada) async {
    final response = await http.post(
      Uri.parse('https://servidor.easychef.click/api/Mesa/All'),
      body: {'nome': nome, 'ocupada': ocupada},
    );
    return response;
  }

  //CONFERIR SE URL PARA DELETAR É ASSIM
  Future<http.Response> deleteGame(String name) async {
    final http.Response response = await http.delete(
      Uri.parse('https://servidor.easychef.click/api/Mesa/$name'),
    );

    return response;
  }

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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: showAllTables(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List allTables = snapshot.data!;
                    List mesas =
                        allTables.map<String>((e) => e['nome']).toList();
                    List codigo =
                        allTables.map<String>((e) => e['codigo']).toList();
                    List ocupada =
                        allTables.map<bool>((e) => e['ocupada']).toList();
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(children: [
                          const Text(
                            "Mesas",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          TextButton(
                            //AQUI VERIFICAR O PORQUE DE NAO ESTAR ADICIONANDO
                            onPressed: () {
                              setState(() {
                                createTables("Mesa Extra", true);
                              });

                              /*cache.addItem(
                        cache.list.length + 1, cache.list.length + 1, false);*/
                              //Navigator.of(context).pushNamed(RouterGenerator.formTable);
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                          for (int i = 0; i < allTables.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromARGB(
                                      0xFF, 0x10, 0x24, 0x34),
                                ),
                                height: 100,
                                width: 380,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  mesas[i].toUpperCase(),
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
                                                  //cache.list[index].isFree
                                                  ocupada[i]
                                                      ? Icons.check
                                                      : Icons.not_interested,
                                                  color: ocupada[i]
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
                                            'Código: ${codigo[i]}',
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    0xFF, 0x6C, 0x75, 0x7D),
                                                fontSize: 12),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            'Ocupada:  ${ocupada[i] ? "Sim" : "Não"}',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                ocupada[i] = !ocupada[i];
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
                            ),
                        ]),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
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
