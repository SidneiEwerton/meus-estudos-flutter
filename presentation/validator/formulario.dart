
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/data/model/maquinas_model.dart';
import 'package:flutter_application_1/data/repositorieimpl/maquinas_repositories_impl.dart';
import 'package:flutter_application_1/presentation/controllers/controllers.dart';
import 'package:flutter_application_1/data/daos/daos_maquinas.dart';
import 'package:flutter_application_1/core/validatorsgeral/validators.dart';

class Formulario {
  final _formKey = GlobalKey<FormState>();
  

 void formularioCadastro({
required BuildContext context,
required Controllers controllers,
required MaquinasRepositoriesImpl repo,
required VoidCallback onSalvar,
required Validators validador,



 }) {
    showDialog(
      
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Cadastrar maquina"),
          content:
          Form(key:_formKey,
            child: 
           Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controllers.nomeControler,
                decoration: InputDecoration(labelText: 'nome da maquina'),
                validator: (value) => Validators.nameMachine(value),
              ),
              TextFormField(
                controller: controllers.modelControler,
                decoration: InputDecoration(labelText: 'modelo/ numero'),
                validator: (value) => Validators.numberMachine(value),
                
              ),
            ],
           ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                if(_formKey.currentState!.validate()){
                  
                  final novaMaquina =  MaquinasModel(
                      register: controllers.nomeControler.text,
                      modelo: controllers.modelControler.text, estaLogada:0,

                    
                  );

                  
                  // 2. CHAMADA AO BANCO DE DADOS:
                  // Usamos o 'await' para garantir que ele salve antes de fechar a janela
                  // O 'toMap()' é aquele tradutor que criamos na sua classe Maquinas
                  await DaosMaquinas().insertMaquina(novaMaquina.toMap());

                  repo.allMaquinas.add(novaMaquina);

                  
                onSalvar();

                controllers.nomeControler.clear();
                controllers.modelControler.clear();
                Navigator.pop(context);
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
 });
 }
 
    

 }