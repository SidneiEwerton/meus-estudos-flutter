
import 'package:flutter_application_1/domain/entities/operador.dart';

abstract class OperadorRepository 
{
  List<Operador> get allOperador;
  void adicionar(Operador operador);
  void remover(int index);

}