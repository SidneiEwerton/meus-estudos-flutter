// ignore_for_file: unused_local_variable

import 'package:flutter_application_1/data/database/dbhelper.dart';
import 'package:flutter_application_1/data/model/maquinas_model.dart';
import 'package:sqflite/sqflite.dart';

class DaosMaquinas {
  final _dbHelper = DbHelper();

  // FUNÇÃO PARA SALVAR Maquina
  Future<int> insertMaquina(Map<String, dynamic> row) 
  async {
    Database dbClient = await _dbHelper.db;
    return await dbClient.insert('maquinas', row);
  }

  // buscar (para os cards não sumir quando fechar o app)
  Future<List<MaquinasModel>> getMaquinas()async 
  {
    Database dbClient = await _dbHelper.db;
    final List<Map<String, dynamic>> maps = await dbClient.query(
      'maquinas',
    ); // requisição do banco de dados
    return List.generate(
      maps.length,
      (i) => MaquinasModel.fromMap(maps[i]),
    ); // converte a lista para um mapa
  }

  // deletar (Para apagar do arquivo .db)
  Future<int> deleteMaquinas(int id) async 
  {
    Database dbClient = await _dbHelper.db;
    return await dbClient.delete('maquinas', where: 'id = ?', whereArgs: [id]);
  }

  // update para logar operador

  Future<int> updateMaquinas(Map<String, dynamic> row)async 
  {
    Database dbClient = await _dbHelper.db;
    return await dbClient.update(
      'maquinas',
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }

  Future<void> registerOperador(MaquinasModel maquina, int operadorId)async 
  {
    maquina.operador_id = operadorId;
    maquina.estaLogada = 1;

    await DaosMaquinas().updateMaquinas(maquina.toMap());
  }

  Future<void> atualizarStatusMaquina(
    int maquinaId,
    int status,
    int? operadorId,
  ) async {
    Database dbCliente = await _dbHelper.db;
    await dbCliente.update(
      'maquinas',
      {'estaLogada': status, 'operador_id': operadorId},
      where: 'id = ?',
      whereArgs: [maquinaId],
    );
  }
}
