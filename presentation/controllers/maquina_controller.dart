import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database/dbhelper.dart';
import 'package:flutter_application_1/data/model/maquinas_model.dart';
import 'package:flutter_application_1/data/daos/daos_maquinas.dart';

class MaquinaController extends ChangeNotifier {
  final List<MaquinasModel> listaMaquinas = [];
  bool carregando = false;
  // ignore: unused_field
  final _dbHelper = DbHelper();
  

  // Busca no banco e atualiza a lista
  Future<void> carregarMaquinas() async {
    carregando = true;
    notifyListeners(); 

    final dados = await DaosMaquinas().getMaquinas();
    listaMaquinas.clear();
    listaMaquinas.addAll(dados);

    carregando = false;
    notifyListeners();
  }

  // Deleta do banco e da lista
  Future<void> excluir(MaquinasModel maquina) async {
    if (maquina.id != null) {
      await DaosMaquinas().deleteMaquinas(maquina.id!);
      await carregarMaquinas(); 
    }
  }

 // Logar o operador na máquina 
Future<void> registerOperador(MaquinasModel maquina, int operadorId) async {
  maquina.operador_id = null;
  maquina.estaLogada = 1;

 
  await DaosMaquinas().updateMaquinas(maquina.toMap());
  
  notifyListeners();
}

  Future<void> atualizarStatusMaquina(int i, int j, param2) async {}

  
  Future<void> removerOperador(MaquinasModel maquina) async {
   
    maquina.estaLogada = 0;
    maquina.operador_id = null; 

    await DaosMaquinas().updateMaquinas(maquina.toMap());
    
  }

  
  
  }
