
import 'package:flutter_application_1/domain/entities/tools.dart';
import 'package:flutter_application_1/domain/repository/tool_repository.dart';

class ToolRepositoriesImpl extends ToolRepository{
  final List<Tools> _listaTool = [];

  @override
  
  List<Tools> get allToll => _listaTool;
  
  
  @override
  void adicionar(Tools toll) 
  {
  _listaTool.add(toll);
  }


  @override
  void remover(int index) {
   _listaTool.removeAt(index);
  }
}