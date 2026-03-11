import 'package:contole_producao/validator/cadastros/models/maquinas.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {

  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  DbHelper._internal();

  static Database? _db;

  Future<Database> get db async{
    if(_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async{

    String path = join(await getDatabasesPath(),'controle_producao.db');

    return await openDatabase(path,
    version: 1,
    onCreate: (db, version) async{
      // criando a tabela de maquinas 
      await db.execute('''
CREATE TABLE maquinas (
id INTEGER PRIMARY KEY AUTOINCREMENT,
register TEXT NOT NULL,
modelo TEXT NOT NULL)
''');

    },
    );
  }
  // FUNÇÃO PARA SALVAR
  Future<int> insertMaquina(Map<String,dynamic> row)async {
    Database dbClient = await db;
    return await dbClient.insert('maquinas',row);
  }

// buscar (para os cards não sumir quando fechar o app)
Future<List<Maquinas>> getMaquinas() async{
  Database dbClient = await db;
  final List<Map<String, dynamic>> maps = await dbClient.query('maquinas');
  return List.generate(maps.length,(i) => Maquinas.fromMap(maps[i]));
}

// deletar (Para apagar do arquivo .db)
Future<int> deleteMaquina(int id) async {
  Database dbClient = await db;
  return await dbClient.delete('maquinas',
  where: 'id = ?',
  whereArgs: [id],);
}



}