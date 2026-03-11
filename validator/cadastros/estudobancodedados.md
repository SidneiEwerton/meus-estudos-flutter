import 'package:contole_producao/validator/cadastros/models/maquinas.dart'; // Importa o modelo que criamos (o desenho técnico da máquina)
import 'package:sqflite/sqflite.dart'; // Importa a biblioteca que conversa com o banco de dados
import 'package:path/path.dart'; // Importa a biblioteca que gerencia caminhos de arquivos (pastas)

class DbHelper {
  // --- PADRÃO SINGLETON (Garante que só exista um "Gerente" do banco) ---
  
  // Cria a única instância interna da classe
  static final DbHelper _instance = DbHelper._internal(); 
  
  // O factory faz com que, ao chamar DbHelper(), ele sempre retorne a mesma _instance lá de cima
  factory DbHelper() => _instance; 
  
  // O construtor privado que impede criar cópias dessa classe fora deste arquivo
  DbHelper._internal(); 

  // Variável que vai guardar a conexão aberta (começa vazia/nula)
  static Database? _db; 

  // --- CONEXÃO INTELIGENTE ---
  
  // Função que o app usa para "chamar" o banco
  Future<Database> get db async {
    if (_db != null) return _db!; // Se já estiver aberto, devolve a conexão que já existe
    _db = await _initDb(); // Se estiver fechado, chama a função para "ligar" o banco
    return _db!; // Retorna o banco recém-aberto
  }

  // --- INICIALIZAÇÃO DO ARQUIVO ---

  Future<Database> _initDb() async {
    // Descobre onde o sistema operacional guarda os bancos e define o nome do arquivo .db
    String path = join(await getDatabasesPath(), 'controle_producao.db');

    // Abre o arquivo. Se ele não existir, o 'onCreate' entra em ação
    return await openDatabase(
      path,
      version: 1, // Versão do banco (importante para atualizações futuras)
      onCreate: (db, version) async {
        // Este bloco só roda na PRIMEIRA VEZ que o app é instalado
        // Executa o comando SQL para fabricar a tabela no arquivo
        await db.execute('''
          CREATE TABLE maquinas (
            id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador único gerado sozinho
            register TEXT NOT NULL,                -- Coluna de texto para o registro
            modelo TEXT NOT NULL                   -- Coluna de texto para o modelo
          )
        ''');
      },
    );
  }

  // --- CRUD (Operações de Dados) ---

  // FUNÇÃO PARA SALVAR: Recebe os dados como um Mapa e insere na tabela
  Future<int> insertMaquina(Map<String, dynamic> row) async {
    Database dbClient = await db; // Pede a conexão (get db)
    return await dbClient.insert('maquinas', row); // Manda o SQL inserir a linha
  }

  // BUSCAR: Transforma as linhas do banco de volta em uma lista de objetos 'Maquinas'
  Future<List<Maquinas>> getMaquinas() async {
    Database dbClient = await db;
    // Faz uma "query" (pergunta) ao banco por tudo que está na tabela
    final List<Map<String, dynamic>> maps = await dbClient.query('maquinas');
    
    // Converte cada Mapa retornado em um objeto Maquina usando o nosso 'factory' fromMap
    return List.generate(maps.length, (i) => Maquinas.fromMap(maps[i]));
  }

  // DELETAR: Apaga do arquivo .db usando o ID como referência
  Future<int> deleteMaquina(int id) async {
    Database dbClient = await db;
    return await dbClient.delete(
      'maquinas',      // Nome da tabela
      where: 'id = ?', // A condição (filtro) para não apagar tudo
      whereArgs: [id], // O valor que substitui o '?' por segurança
    );
  }
}