
//import 'package:contole_producao/models/machines.dart';
import 'package:contole_producao/telas/production_screm.dart';
import 'package:contole_producao/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
   //backgroundColor: Colors.blue,
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Center( child:  Text('UsiVale')),
      leading: Icon(Icons.architecture),   
    ),
    body: Container( 
      width: double.infinity,
      height: double.infinity,
  decoration:const BoxDecoration(image: 
  DecorationImage(image: AssetImage('asset_imagenscnc/Manufatura.jpg'),
  fit: BoxFit.cover),
  ),
    child: Center(child: 
    
     CustomButton(onPressed: (){Navigator.push(context, 
    MaterialPageRoute(builder:(context) => ProductionScrem()),);},
    icon: Icon(Icons.precision_manufacturing),
    style: 
    ButtonStyle(minimumSize: WidgetStatePropertyAll(const Size(200, 60)),
    ),
    text: Text('Tela de Produção',
    style: TextStyle(fontWeight: FontWeight.bold,)) ),
   )));
  }
}