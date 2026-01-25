import 'package:contole_producao/custom_container.dart';
//import 'package:contole_producao/models/machines.dart';
import 'package:contole_producao/telas/planning_production.dart';
import 'package:flutter/material.dart';

class ProductionScrem extends StatefulWidget {
  @override
  State<ProductionScrem> createState() => _ProductionScremState();
  


}

class _ProductionScremState extends State<ProductionScrem> {

   String statusAtual = 'aguardando';

 void verificarStatus() {
  setState(() {
    
    statusAtual = "Máquina em Operação";
  });
}

// final Machines machine;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      drawer: Drawer(
        child: Column(
          children: [
            Text('Qualidade'),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanningProduction(maxLine: 1),
                  ),
                );
              },
              child: Text('Proximos Trabalhos'),
            ),
            SizedBox(height: 20),
            Text('Operadores'),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Staus: $statusAtual')),
        
      ),
      
      body: Row(children: [ 
              CustomContainer( 
                onTap:  () => verificarStatus(),
                height: 100,
                width: 100,
               
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  image:const DecorationImage(image: AssetImage("asset_imagenscnc/images.jpg" ),
                  fit: BoxFit.cover
                  ),
                  ),
              ),
          SizedBox(width: 50,),
          CustomContainer(
            appBar: AppBar(title: Text('minhaMaquina')),
            
          onTap: () => verificarStatus(),
            
          height: 100, width: 100, 
          decoration: BoxDecoration(color: Colors.white,
          image: DecorationImage(image: AssetImage("asset_imagenscnc/MaquinasCentur.png"),
          fit: BoxFit.cover), 
          borderRadius: BorderRadius.circular(12),))
    ])
    );
    
  }
}
