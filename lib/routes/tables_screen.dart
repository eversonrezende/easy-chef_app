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
    await Future.delayed(const Duration(days: 1));

    final response = await http
        .get(Uri.parse('https://servidor.easychef.click/api/Mesa/All'));

    tables = json.decode(response.body) as List;

    return tables;
  }

  Future<http.Response> createTables(String mesa) async {
    final response = await http.post(
        Uri.parse('https://servidor.easychef.click/api/Mesa/Add'),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode({"nome": mesa, "codigo": "", "ocupada": true}));

    return response;
  }

  Future<http.Response> editaTables(
      String id, String nome, bool ocupada) async {
    if (ocupada == true) {
      ocupada = false;
    } else {
      ocupada = true;
    }

    final response = await http.put(
        Uri.parse('https://servidor.easychef.click/api/Mesa/Edit'),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode(
            {"id": id, "nome": nome, "codigo": "", "ocupada": ocupada}));

    return response;
  }

  Future<http.Response> deleteTable(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://servidor.easychef.click/api/Mesa/Delete/$id'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
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
                    List id = allTables.map<String>((e) => e['id']).toList();
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(children: [
                          const Text(
                            "Mesas",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                createTables("Mesa");
                              });
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
                                                width: 120,
                                                height: 26,
                                                child: Text(
                                                  mesas[i],
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
                                            'C??digo: ${codigo[i]}',
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
                                            'Ocupada:  ${ocupada[i] ? "Sim" : "N??o"}',
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
                                                editaTables(id[i], mesas[i],
                                                    ocupada[i]);
                                              });
                                            },
                                            icon: const Icon(Icons.edit),
                                            color: Colors.white,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                deleteTable(id[i]);
                                              });
                                            },
                                            icon: const Icon(Icons
                                                .highlight_remove_outlined),
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
