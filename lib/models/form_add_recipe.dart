import 'package:flutter/material.dart';

class FormAddRecipe extends StatefulWidget {
  const FormAddRecipe({Key? key}) : super(key: key);

  @override
  State<FormAddRecipe> createState() => _FormAddRecipeState();
}

class _FormAddRecipeState extends State<FormAddRecipe> {
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
              child: Image.asset('assets/images/cake-image.png'),
            ),
            const Text(
              'Bolo',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '6x ingredientes',
                    style: TextStyle(
                        color: Color.fromARGB(0xFF, 0x6C, 0x75, 0x7D),
                        fontSize: 12),
                  ),
                  Text(
                    'R\$ 9,50',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
