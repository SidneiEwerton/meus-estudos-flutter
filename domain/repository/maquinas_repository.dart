
import 'package:flutter_application_1/domain/entities/maquinas.dart';

abstract class MaquinasRepository {
  List<Maquinas> get allMaquinas;
  void adicionar(Maquinas maquina);
  void removeAt(int index);
}