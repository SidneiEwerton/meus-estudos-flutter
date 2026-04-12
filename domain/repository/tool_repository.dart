import 'package:flutter_application_1/domain/entities/tools.dart';

abstract class ToolRepository {
   List<Tools> get allToll;
  void adicionar(Tools toll);
  void remover(int index);
}