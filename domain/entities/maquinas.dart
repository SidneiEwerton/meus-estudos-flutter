class Maquinas {
  final int? id;
  final String register;
  final String modelo;
  int estaLogada;
  int? operador_id;

  Maquinas({
    required this.id,
    required this.register,
    required this.modelo,
    this.estaLogada = 0,
    this.operador_id,
  });
}
