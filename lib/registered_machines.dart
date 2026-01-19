import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisteredMachines extends StatelessWidget{

  final String? nome;
  final int? numero;

  const RegisteredMachines({super.key, this.nome, this.numero});

  



  @override
  Widget build(BuildContext context) {
    return Card(
       elevation: 4,
       margin: EdgeInsets.all(100),
       child: Container( 
        
       // height: 100,
        width: 100,
        
       padding:  EdgeInsets.all(16),
       

       decoration: BoxDecoration(color: Colors.white,
       
       borderRadius: BorderRadius.circular(16)
       ),

       child:  Column(
        mainAxisSize:MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Maquina: ${nome?? "sem nome"}',
        style: TextStyle(fontWeight: FontWeight.bold)),
        Text("Numero: ${numero ?? 0}",
        style: TextStyle(fontWeight: FontWeight.bold, color:   Colors.green,))]
    ))
       

       
       
       );
  }
}