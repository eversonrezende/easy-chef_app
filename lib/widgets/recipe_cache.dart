import 'dart:collection';

import 'package:easy_chef/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeCache with ChangeNotifier{
  var _index = -1;

  final List<RecipeModel> _recipes = [
    RecipeModel(
        photo: 'assets/images/cake-image.png',
        name: 'Bolo',
        numberIngredient: 6,
        price: 9.50),
    RecipeModel(
        photo: 'assets/images/cake-image.png',
        name: 'Bolo',
        numberIngredient: 6,
        price: 9.50),
    RecipeModel(
        photo: 'assets/images/cake-image.png',
        name: 'Bolo',
        numberIngredient: 6,
        price: 9.50),
    RecipeModel(
        photo: 'assets/images/cake-image.png',
        name: 'Bolo',
        numberIngredient: 6,
        price: 9.50),
    RecipeModel(
        photo: 'assets/images/cake-image.png',
        name: 'Bolo',
        numberIngredient: 6,
        price: 9.50),
  ];

  void addItem(String photo, String name, int numberIngredient, double price) {
    _recipes.add(RecipeModel(
        photo: photo,
        name: name,
        numberIngredient: numberIngredient,
        price: price));
  }

  void remove(int index) {
    _recipes.removeAt(index);
  }

  int get index => _index;

  set index(int value) {
    if ((value >= 0) && (value < _recipes.length)) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<RecipeModel> get list =>
      UnmodifiableListView<RecipeModel>(_recipes);
}
