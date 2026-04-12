import 'package:flutter_application_1/data/database/dbhelper.dart';
import 'package:flutter_application_1/data/model/operador_model.dart';
import 'package:sqflite/sqflite.dart';

class DaosOperador {
  final _dbHelper = DbHelper();

  // insere um operador
  Future<int> insertOperador(Map<String, dynamic> row) async {
    Database dbCliente = await _dbHelper.db;
    return await dbCliente.insert('operadores', row);
  }

  // guarda o operador na memoria
  Future<List<OperadorModel>> getOperador() async {
    Database dbCliente = await _dbHelper.db;
    final List<Map<String, dynamic>> op = await dbCliente.query('operadores');
    return List.generate(op.length, (i) => OperadorModel.fromMap(op[i]));
  }

  // deleta o operador
  Future<int> deletarOperador(int id) async {
    Database dbCliente = await _dbHelper.db;
    return await dbCliente.delete(
      'operadores',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<OperadorModel?> getOperadorPorId(int id) async {
    Database dbCliente = await _dbHelper.db;
    // Faz a busca na tabela 'operadores' onde o id é igual ao digitado
    final List<Map<String, dynamic>> maps = await dbCliente.query(
      'operadores',
      where: 'id = ?',
      whereArgs: [id],
    );

    // Se encontrou alguém, transforma o "mapa" em um objeto Operador
    if (maps.isNotEmpty) {
      return OperadorModel.fromMap(maps.first);
    }

    // Se não encontrou nada, retorna nulo
    return null;
  }
}
