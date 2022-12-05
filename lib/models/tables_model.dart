import 'package:easy_chef/models/table_model.dart';
import 'package:flutter/cupertino.dart';

class TablesModel extends ChangeNotifier {
  List<TableModel> tables;

  TablesModel({required this.tables});

  void add(TableModel table) {
    tables.add(table);
    notifyListeners();
  }

  void remove(int index)
  {
    tables.removeAt(index);
    notifyListeners();
  }
}
