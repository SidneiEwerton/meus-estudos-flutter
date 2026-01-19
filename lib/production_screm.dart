import 'package:contole_producao/registered_machines.dart';
import 'package:contole_producao/telasDeprodu%C3%A7%C3%A3o/planning_production.dart';
import 'package:flutter/material.dart';

class ProductionScrem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      drawer: Drawer(child: Column(children: [Text('Qualidade'),
      SizedBox(height: 20,),
      TextButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder:(context) => PlanningProduction(maxLine:1,)));
      }, child: Text('Proximos Trabalhos'))
      ,
      SizedBox(height: 20,),
      Text('Operadores')],),),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center( child: Text('Maquinas em Produção'),)
      ),
      body: Row(children: [  RegisteredMachines(nome: 'Romi Centur',numero: 1616,),
      RegisteredMachines(nome: 'Ecoca',numero: 1699,),
      RegisteredMachines(nome: 'Multiplq', numero: 1622,),
      RegisteredMachines(nome: 'Ecoca', numero: 1634,),
      ],),
    );
  }
}