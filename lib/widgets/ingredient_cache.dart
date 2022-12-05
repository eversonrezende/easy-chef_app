import 'dart:collection';

import 'package:easy_chef/models/ingredient_model.dart';
import 'package:flutter/material.dart';

class IngredientCache with ChangeNotifier{
  var _index = -1;

  final List<IngredientModel> _ingredients = [
    IngredientModel(
        photo: "assets/images/ingredient-image.png",
        name: "Farinha",
        price: 2.5),
    IngredientModel(
        photo: "assets/images/ingredient-image.png",
        name: "Farinha",
        price: 2.5),
    IngredientModel(
        photo: "assets/images/ingredient-image.png",
        name: "Farinha",
        price: 2.5),
    IngredientModel(
        photo: "assets/images/ingredient-image.png",
        name: "Farinha",
        price: 2.5),
    IngredientModel(
        photo: "assets/images/ingredient-image.png",
        name: "Farinha",
        price: 2.5),
  ];

  void addItem(String photo, String name, double price) {
    _ingredients.add(IngredientModel(photo: photo, name: name, price: price));
  }

  void remove(int index) {
    _ingredients.removeAt(index);
  }

  int get index => _index;

  set index(int value) {
    if ((value >= 0) && (value < _ingredients.length)) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<IngredientModel> get list =>
      UnmodifiableListView<IngredientModel>(_ingredients);
}
