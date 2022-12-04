import 'package:easy_chef/routes.dart';
import 'package:easy_chef/routes/form_table.dart';
import 'package:easy_chef/routes/tables_screen.dart';
import 'package:easy_chef/widgets/table_cache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


 Future main() async {
   runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<TableCache>(
      create: (_) => TableCache(),
      child: MaterialApp(
        onGenerateTitle: (context) => "EasyChef",
        home: TablesScreen(),
        onGenerateRoute: RouterGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}