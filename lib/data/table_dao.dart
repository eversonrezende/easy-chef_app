import 'package:easy_chef/data/database.dart';
import 'package:easy_chef/models/Table.dart';
import 'package:sqflite/sqflite.dart';

class TableDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_nome TEXT, '
      '$_codigo INTEGER, '
      '$_isOcupado BOOLEAN)';

  static const String _tablename = 'table';
  static const String _nome = 'nome';
  static const String _codigo = 'codigo';
  static const String _isOcupado = 'isOcupado';

  save(Table mesa) async {
    print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var tableExists = await find(mesa.nome);
    Map<String, dynamic> tableMap = toMap(mesa);

    if (tableExists.isEmpty) {
      print('a mesa não Existia');
      return await bancoDeDados.insert(_tablename, tableMap);
    } else {
      print('A mesa já existia!');
      return await bancoDeDados.update(
        _tablename,
        tableMap,
        where: '$_nome = ?',
        whereArgs: [mesa.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Table mesa) {
    print('Convertendo Mesa em Map: ');
    final Map<String, dynamic> mapaDeMesas = {};
    mapaDeMesas[_nome] = mesa.nome;
    mapaDeMesas[_codigo] = mesa.codigo;
    mapaDeMesas[_isOcupado] = mesa.isOcupado;
    print('Mapa de Mesas: $mapaDeMesas');
    return mapaDeMesas;
  }

  Future<List<Table>> findAll() async {
    print('Acessando o findAll');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Table> toList(List<Map<String, dynamic>> listaDeMesas) {
    print('Convertendo to List:');
    final List<Table> mesas = [];
    for (Map<String, dynamic> linha in listaDeMesas) {
      final Table mesa = Table();
      //final Table mesa = Table(linha[_nome], linha[_codigo], linha[_isOcupado]);
      mesas.add(mesa);
    }
    print('Lista de mesas $mesas');
    return mesas;
  }

  Future<List<Table>> find(String nome) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_nome = ?',
      whereArgs: [nome],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(int codigo) async {
    print('Deletando mesa: $codigo');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: '$_codigo = ?',
      whereArgs: [codigo],
    );
  }
}