import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositorieimpl/tool_repositories_impl.dart';

class RegisterTools extends StatefulWidget {

  @override
  State<RegisterTools> createState() => _RegisterToolsState();
}

class _RegisterToolsState extends State<RegisterTools> {
final nomeController = TextEditingController();
final ferr = ToolRepositoriesImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Registro de ferramentas'),
      ),
      body:  ListView.builder(
  
  itemCount: ferr.allToll.length, 

  itemBuilder: (context, index) {
    
    final ferramenta = ferr.allToll[index];

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