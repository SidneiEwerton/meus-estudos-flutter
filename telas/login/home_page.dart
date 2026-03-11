import 'package:contole_producao/telas/login/register_machines.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina inicial(opções)')),

      body: ListView(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterMachines(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Padding(padding: EdgeInsetsGeometry.all(100)),
                    Chip(
                      label: Text(
                        ' Maquinas tornos CNC',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    
                  ],
                )
                ),
                 GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterMachines(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Padding(padding: EdgeInsetsGeometry.all(100)),
                    Chip(
                      label: Text(
                        ' fresa 3 eixos  CNC',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    
                  ],
                )
                ),
            ],
          ),
          //SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterMachines(),
                ),
              );
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsetsGeometry.all(100)),
                Chip(
                  label: Text(
                    ' Maquinas Fresa CNC',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                
              ],
            )
          )
    
    
    
        ],
      ),
    );
  }
}
