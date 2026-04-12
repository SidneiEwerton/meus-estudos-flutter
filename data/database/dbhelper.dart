

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  // Padrao Singleton (Garante que só exista uma instancia do banco aberta)
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  DbHelper._internal();

  static Database? _db;

  // Getter para acessar o banco de dados
  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'controle_producao.db');

    return await openDatabase(
      path,
      version: 2, // Versão atualizada para suportar as novas colunas
      onConfigure: (db) async {
        // Ativa o suporte a Chaves Estrangeiras (Foreign Keys)
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // --- CRIAÇÃO DAS TABELAS (Executado na primeira instalação) ---
  Future<void> _onCreate(Database db, int version) async {
    // 1. Tabela de Operadores
    await db.execute('''
      CREATE TABLE operadores (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        cargo TEXT NOT NULL,
        setor TEXT NOT NULL
      )
    ''');

    // 2. Tabela de Máquinas
    await db.execute('''
      CREATE TABLE maquinas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        register TEXT NOT NULL,
        modelo TEXT NOT NULL,
        operador_id INTEGER,
        estaLogada INTEGER DEFAULT 0,
        FOREIGN KEY (operador_id) REFERENCES operadores (id) ON DELETE SET NULL
      )
    ''');
  }

  // --- ATUALIZAÇÃO DO BANCO (Executado se a versão aumentar) ---
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Se o usuário tinha a versão 1, adicionamos o que falta
      // Adiciona coluna operador_id
      await db.execute('ALTER TABLE maquinas ADD COLUMN operador_id INTEGER');
      // Adiciona coluna estaLogada
      await db.execute('ALTER TABLE maquinas ADD COLUMN estaLogada INTEGER DEFAULT 0');
      
      // Cria a tabela de operadores caso ela não existisse na V1
      await db.execute('''
        CREATE TABLE IF NOT EXISTS operadores (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          nome TEXT NOT NULL,
          cargo TEXT NOT NULL,
          setor TEXT NOT NULL
        )
      ''');
    }
  }
}