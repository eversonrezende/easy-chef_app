import 'dart:collection';

import 'package:easy_chef/models/table_model.dart';
import 'package:flutter/cupertino.dart';

class TableCache with ChangeNotifier {
  var _index = -1;

  final List<TableModel> _tables = [
    TableModel(tableNumber: 1, code: 1, isFree: true),
    TableModel(tableNumber: 2, code: 2, isFree: false),
    TableModel(tableNumber: 3, code: 3, isFree: false),
    TableModel(tableNumber: 4, code: 4, isFree: true),
    TableModel(tableNumber: 5, code: 5, isFree: true),
  ];

  void addItem(int tableNumber, int code, bool isFree) {
    _tables
        .add(TableModel(tableNumber: tableNumber, code: code, isFree: isFree));
    notifyListeners();
  }

  void remove(int index) {
    _tables.removeAt(index);
    notifyListeners();
  }

  int get index => _index;

  set index(int value) {
    if ((value >= 0) && (value < _tables.length)) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<TableModel> get list =>
      UnmodifiableListView<TableModel>(_tables);
}
