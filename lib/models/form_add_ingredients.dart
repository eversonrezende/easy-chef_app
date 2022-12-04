import 'package:flutter/material.dart';

class FormAddIngredients extends StatefulWidget {
  const FormAddIngredients({Key? key}) : super(key: key);

  @override
  State<FormAddIngredients> createState() => _FormAddIngredientsState();
}

class _FormAddIngredientsState extends State<FormAddIngredients> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 8),
              child: Image.asset('assets/images/ingredient-image.png'),
            ),
            const Text(
              'Farinha',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 150),
              child: Text(
                'R\$ 2,50',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
