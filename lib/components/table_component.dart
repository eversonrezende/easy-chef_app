import 'package:flutter/material.dart';

class TableComponent extends StatefulWidget {
  const TableComponent(
      {Key? key, required this.name, required this.code, required this.isFree})
      : super(key: key);
  final String name;
  final int code;
  final bool isFree;

  @override
  State<TableComponent> createState() => _TableComponentState();
}

class _TableComponentState extends State<TableComponent> {
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
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15, top: 15, right: 5, bottom: 5),
                      child: SizedBox(
                        width: 90,
                        height: 26,
                        child: Text(
                          widget.name,
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, top: 5),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Icon(
                          widget.isFree ? Icons.check : Icons.not_interested,
                          color: widget.isFree ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  child: Text(
                    'Código: ${widget.code}',
                    style: const TextStyle(
                        color: Color.fromARGB(0xFF, 0x6C, 0x75, 0x7D),
                        fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Ocupada:  ${widget.isFree ? "Sim" : "Não"}',
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
              child: Image.asset('assets/images/recipes-icon.png'),
            ),
          ],
        ),
      ),
    );
  }
}
