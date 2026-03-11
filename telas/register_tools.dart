import 'package:contole_producao/validator/cadastros/models/lista_register.dart';
import 'package:flutter/material.dart';

class RegisterTools extends StatefulWidget {

  @override
  State<RegisterTools> createState() => _RegisterToolsState();
}

class _RegisterToolsState extends State<RegisterTools> {
final nomeController = TextEditingController();
final ferr = listaTools();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Registro de ferramentas'),
      ),
      body:  ListView.builder(
  
  itemCount: ferr.tool.length, 

  itemBuilder: (context, index) {
    
    final ferramenta = ferr.tool[index];

    // 3. O itemBuilder PRECISA de um return
    return ListTile(
      leading: const Icon(Icons.handyman),
      title: Text(ferramenta.name), // Use os campos da sua classe Ferramenta
      subtitle: Text(ferramenta.especificacao), 
    );
  },
),
    
    
    
    );
  }
}