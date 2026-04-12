import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/operador_model.dart';
import 'package:flutter_application_1/data/daos/daos_operador.dart';

class OperadorController extends ChangeNotifier {
  final List<OperadorModel> listOperadores = [];
  bool loading = false;

  // buscar no banco de dados e atualizar a lista

  String nomeDigitado;
  String cargoDigitado;
  String setorDigitado;

  OperadorController({
    required this.nomeDigitado,
    required this.cargoDigitado,
    required this.setorDigitado,
  });

  Future<void> salvarNobanco() async {
    

    Map<String, dynamic> dados = {
      'nome': nomeDigitado,
      'cargo': cargoDigitado,
      'setor': setorDigitado,
    };

    await DaosOperador().insertOperador(dados);

   
    await carregarOperadores();
  }

  Future<void> carregarOperadores() async {
    loading = true;
    notifyListeners();

    final informacao = await DaosOperador().getOperador();

    listOperadores.clear();
    listOperadores.addAll(informacao);

    loading = false;
    notifyListeners();
  }

  // para deletar do banco de dados e da lista

  Future<void> deletar(OperadorModel operadores) async {
    await DaosOperador().deletarOperador(operadores.id);
    await carregarOperadores();
  }
}
