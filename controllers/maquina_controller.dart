import 'package:contole_producao/validator/cadastros/dbhelper.dart';
import 'package:contole_producao/validator/cadastros/models/maquinas.dart';
import 'package:flutter/material.dart';

class MaquinaController extends ChangeNotifier {
  final List<Maquinas> listaMaquinas = [];
  bool carregando = false;

  // Busca no banco e atualiza a lista
  Future<void> carregarMaquinas() async {
    carregando = true;
    notifyListeners(); // Avisa a tela que algo mudou

    final dados = await DbHelper().getMaquinas();
    listaMaquinas.clear();
    listaMaquinas.addAll(dados);

    carregando = false;
    notifyListeners();
  }

  // Deleta do banco e da lista
  Future<void> excluir(Maquinas maquina) async {
    if (maquina.id != null) {
      await DbHelper().deleteMaquina(maquina.id!);
      await carregarMaquinas(); // Recarrega para garantir sincronia
    }
  }
}