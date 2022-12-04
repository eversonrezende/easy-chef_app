import 'package:flutter/material.dart';

class FormAddTable extends StatefulWidget {
  const FormAddTable({Key? key}) : super(key: key);

  @override
  State<FormAddTable> createState() => _FormAddTableState();
}

class _FormAddTableState extends State<FormAddTable> {
  bool ocupado = false;
  int codigo = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
        ),
        height: 100,
        width: 380,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 15, right: 5, bottom: 5),
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
                  child: Text(
                    'Código: $codigo',
                    style: const TextStyle(
                        color: Color.fromARGB(0xFF, 0x6C, 0x75, 0x7D),
                        fontSize: 12),
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset('assets/images/auto_stories_black_24dp 1.png'),
            ),
          ],
        ),
      ),
    );
  }
}
/*
IconButton(
onPressed: () {
ocupado = !ocupado;
},
icon: Icon(Icons.edit),
iconSize: 18,
color: Colors.white,
)*/