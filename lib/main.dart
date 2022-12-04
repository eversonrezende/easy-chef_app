import 'package:easy_chef/routes.dart';
import 'package:easy_chef/routes/tables_screen.dart';
import 'package:flutter/material.dart';


 Future main() async {
   runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "EasyChef",
      home: TablesScreen(),
      onGenerateRoute: RouterGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}