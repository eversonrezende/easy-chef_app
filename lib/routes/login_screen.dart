import 'package:easy_chef/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Easy Chef'),
          leading: Image.asset('assets/images/easy-chef-logo.png'),
          backgroundColor: const Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    repeat: ImageRepeat.repeat),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  width: 304,
                  height: 321,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(0xFF, 0x10, 0x24, 0x34),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromARGB(0xFF, 0x1D, 0x41, 0x5E),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 19),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/easy-chef-logo.png"),
                            const Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Text(
                                'Easy Chef',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white),
                            fillColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira um e-mail válido';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                        child: TextFormField(
                          controller: senhaController,
                          decoration: const InputDecoration(
                            hintText: "Senha",
                            hintStyle: TextStyle(color: Colors.white),
                            fillColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira um e-mail válido';
                            }
                            return null;
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context)
                                .pushNamed(RouterGenerator.tablesScreen);
                          }
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        child: const Text('Entrar'),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
