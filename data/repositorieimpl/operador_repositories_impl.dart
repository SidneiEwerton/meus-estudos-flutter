import 'package:flutter_application_1/domain/entities/operador.dart';
import 'package:flutter_application_1/domain/repository/operador_repository.dart';

class OperadorRepositoriesImpl extends OperadorRepository{
  final List<Operador> _listaOperadores = [];

  @override
  
  List<Operador> get allOperador => _listaOperadores;
 
 
  @override
  void adicionar(Operador operador) 
  {
   _listaOperadores.add(operador);
  }


  @override
  void remover(int index) 
  {
   _listaOperadores.removeAt(index);
  }
}