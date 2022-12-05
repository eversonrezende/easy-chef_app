import 'package:easy_chef/models/table_model.dart';
import 'package:easy_chef/models/tables_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormTable extends StatefulWidget {
  const FormTable({Key? key}) : super(key: key);

  @override
  State<FormTable> createState() => _FormTableState();
}

class _FormTableState extends State<FormTable> {
  bool isChecked = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.greenAccent;
    }

    return Form(
      key: _formKey,
      child: Scaffold(
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
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                image: const DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    repeat: ImageRepeat.repeat),
              ),
              height: 670,
              width: 385,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.white),
                          fillColor: Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
                          hintText: 'Mesa + Número',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true),
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o nome e número da mesa';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: codeController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.white),
                          fillColor: Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
                          hintText: 'Código da Mesa',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o código da mesa';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Mesa Livre?",
                            style: TextStyle(color: Colors.white),
                          ),
                          Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              })
                        ],
                      ),
                    ),
                  ),
                  Consumer<TablesModel>(
                    builder: (context, cache, _) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            cache.tables.add(TableModel(
                                name: nameController.text,
                                code: int.parse(codeController.text),
                                isFree: isChecked));

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Criando nova Mesa'),
                              ),
                            );
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('Adicionar'),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
