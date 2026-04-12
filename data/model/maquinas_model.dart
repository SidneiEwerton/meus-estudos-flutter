import 'package:flutter_application_1/domain/entities/maquinas.dart';

class MaquinasModel extends Maquinas {
  final int? id;
  final String register;
  final String modelo;
  int estaLogada;
  int? operador_id;

  MaquinasModel({
    required this.register,
    required this.modelo,
    this.operador_id,
    this.id,
    required this.estaLogada,
  }) : 
  super(
      id: id,
      register: register,
      modelo: modelo,
      estaLogada: estaLogada,
      operador_id: operador_id,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'register': register,
      'modelo': modelo,
      'estaLogada': estaLogada,
      'operador_id': estaLogada == 0 ? null : operador_id,
    };
  }

  // pegar o mapa e transfrmar em um objeto em dart

  factory MaquinasModel.fromMap(Map<String, dynamic> map) {
    return MaquinasModel(
      id: map['id'],
      register: map['register'],
      modelo: map['modelo'],
      operador_id: map['operador_id'], // Recupera o ID do banco
      estaLogada: map['estaLogada'], // Transforma o 1 do banco de volta em true
    );
  }
}
