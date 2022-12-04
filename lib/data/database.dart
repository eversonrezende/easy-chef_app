import 'package:easy_chef/data/table_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'kitchen.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TableDao.tableSql);
  }, version: 1,);
}
