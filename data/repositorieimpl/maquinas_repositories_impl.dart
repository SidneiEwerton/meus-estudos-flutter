
import 'package:flutter_application_1/domain/entities/maquinas.dart';
import 'package:flutter_application_1/domain/repository/maquinas_repository.dart';

class MaquinasRepositoriesImpl extends MaquinasRepository{

final  List<Maquinas> _listaMaquinas = [];

  @override
  
  List<Maquinas> get allMaquinas => _listaMaquinas;

  @override
  void adicionar(Maquinas maquina) {
    _listaMaquinas.add(maquina);
  }

  

  @override
  void removeAt(int index) {
    _listaMaquinas.removeAt(index);
  }
}