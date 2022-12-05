import 'package:easy_chef/models/table_model.dart';
import 'package:flutter/cupertino.dart';

class RecipesModel extends ChangeNotifier {
  List<TableModel> recipes;

  RecipesModel({required this.recipes});

  void add(TableModel table) {
    recipes.add(table);
    notifyListeners();
  }

  void remove(int index)
  {
    recipes.removeAt(index);
    notifyListeners();
  }
}
