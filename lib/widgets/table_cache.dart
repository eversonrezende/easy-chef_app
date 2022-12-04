import 'dart:collection';

import 'package:easy_chef/models/table_model.dart';

class TableCache {
  var _index = -1;

  final List<TableModel> _tables = [
    const TableModel("Mesa 01", 1, true),
    const TableModel('Mesa 02', 2, true),
    const TableModel('Mesa 03', 3, true),
    const TableModel('Mesa 04', 4, true),
  ];

  void addItem(String name, int code, bool isFree) {
    _tables.add(TableModel(name, code, isFree));
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
