import 'dart:collection';

import 'package:easy_chef/models/table_model.dart';
import 'package:flutter/cupertino.dart';

class TableCache with ChangeNotifier{
  var _index = -1;

  final List<TableModel> _tables = [
    TableModel(name: 'Mesa 01', code: 1, isFree: true),
    TableModel(name: 'Mesa 02', code: 2, isFree: false),
    TableModel(name: 'Mesa 03', code: 3, isFree: false),
    TableModel(name: 'Mesa 04', code: 4, isFree: true),
    TableModel(name: 'Mesa 05', code: 5, isFree: true),
  ];

  void addItem(String name, int code, bool isFree) {
    _tables.add(TableModel(name: name, code: code, isFree: isFree));
  }

  void remove(int index)
  {
    _tables.removeAt(index);
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
