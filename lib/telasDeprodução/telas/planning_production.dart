
 import 'package:flutter/material.dart';

class PlanningProduction extends StatefulWidget {

  final String? labelText;
  final int? quantidade;
  final int maxLine;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final TextStyle? style;



  const PlanningProduction({ super.key, this.labelText, this.quantidade, 
  required this.maxLine, this.controller,this.keyBoardType,this.style });

  @override
  State<PlanningProduction> createState() => _PlanningProductionState(
    
  );
}

class _PlanningProductionState extends State<PlanningProduction> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          
           backgroundColor: Colors.white, 
           appBar: AppBar(title: Center(child: Text('Planejamento de Produção'
           ,style: TextStyle(fontWeight: FontWeight.bold),),),
           backgroundColor: Colors.blueGrey,),
           body: Padding(padding: EdgeInsetsGeometry.all(14),
           
           child:  TextField( 
            controller: widget.controller,
            maxLines: 3,
            decoration:InputDecoration(
              labelText: widget.labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            ) ,
            
            

            
            
            
           ),
       );
  }
}
