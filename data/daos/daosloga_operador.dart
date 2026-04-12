
import 'package:flutter_application_1/data/database/dbhelper.dart';
import 'package:flutter_application_1/data/model/operador_model.dart';
import 'package:sqflite/sqflite.dart';

class DaoslogaOperador {
  final _dbHelper = DbHelper();

  // Buscar o operador especifico pelo ID
Future<OperadorModel?> getOperadorId(int id) async{
  Database dbCliente = await _dbHelper.db;

  final List<Map<String, dynamic>> maps = await dbCliente.query('operadores',
  where: 'id = ?',
  whereArgs: [id],);

  print("Operador encontrado");

  if(maps.isNotEmpty){
    return OperadorModel.fromMap(maps.first);
  }
  return null;
  }// fim do metodo de busca



  Future<List<OperadorModel>> getOperador() async{
    Database dbClient = await _dbHelper.db;
    final List<Map<String, dynamic>> maps = await dbClient.query('operadores',);

   return List.generate(maps.length, (i)=> OperadorModel.fromMap(maps[i]));

   


  }
  



}
