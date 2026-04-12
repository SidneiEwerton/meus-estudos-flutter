import 'package:flutter_application_1/domain/entities/operador.dart';

class OperadorModel extends Operador  {
  int id;
  String cargo;
  String setor;
  String nome;

  OperadorModel( {
    required this.id,
    required this.cargo,
    required this.setor,
    required this.nome,
  }):super(
    id: id,
    cargo: cargo,
    setor: setor,
    nome: nome,
  );




  

  Map<String, dynamic> toMap() {
    return {'id': id, 'cargo': cargo, 'setor': setor, 'nome': nome};
  }

  factory OperadorModel.fromMap(Map<String, dynamic> op) {
    return OperadorModel(
      id: op['id'],
      cargo: op['cargo'],
      setor: op['setor'],
      nome: op['nome'],
    );
  }
}
