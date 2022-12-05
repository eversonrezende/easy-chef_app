import 'package:easy_chef/models/ingredient_model.dart';
import 'package:flutter/cupertino.dart';

class IngredientsModel extends ChangeNotifier {
  List<IngredientModel> ingredients;

  IngredientsModel({required this.ingredients});

  void add(IngredientModel ingredient) {
    ingredients.add(ingredient);
    notifyListeners();
  }

  void remove(int index)
  {
    ingredients.removeAt(index);
    notifyListeners();
  }
}
