
import 'package:contole_producao/production_screm.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.blue,
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Center( child:  Text('UsiVale')),
      leading: Icon(Icons.architecture),   
    ),
    body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ ElevatedButton(onPressed: (){
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductionScrem())); 
      
      }, child: Text('Login'),),
    TextButton(onPressed: (){}, child: Text('Esqueci a senha'))],),),
   );
  }
}