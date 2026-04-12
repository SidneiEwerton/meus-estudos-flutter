
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/controllers/controllers.dart';
import 'package:flutter_application_1/presentation/controllers/operador_controller.dart';
import 'package:flutter_application_1/core/theme/appicons.dart';
import 'package:flutter_application_1/core/theme/appstrings.dart';
import 'package:flutter_application_1/core/theme/apptext_style.dart';
import 'package:flutter_application_1/core/validatorsgeral/validators.dart';
import 'package:flutter_application_1/presentation/widgets/buttons/custom_eleven_button.dart';
import 'package:flutter_application_1/presentation/widgets/buttons/custom_gesturedetector.dart';
import 'package:flutter_application_1/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/presentation/widgets/layoutwidgets/custom_expanded.dart';

class RegisterOperador extends StatefulWidget {
  @override
  State<RegisterOperador> createState() => _RegisterOperadorState();
}

class _RegisterOperadorState extends State<RegisterOperador> 
{
  final _formKey = GlobalKey<FormState>();

  final controller = Controllers();

  final operadorCtrl = OperadorController
  (
    nomeDigitado: '',
    cargoDigitado: '',
    setorDigitado: '',
  );

  @override
  void initState() {
    super.initState();
    operadorCtrl.carregarOperadores().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text
        ('Cadastros de operadores'),
         centerTitle: true),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            
             SingleChildScrollView(
                padding: EdgeInsets.all(16.0),

                // campo nome
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelText: Appstrings.nome,
                      validator: (value) => Validators.nomeCadastro(value),
                      onSaved: (value) {
                        operadorCtrl.nomeDigitado = value!;
                      },
                    ),

                    SizedBox(height: 10),
                    // campo para adicionar cargo
                    CustomTextFormField(
                      labelText: Appstrings.cargo,
                      validator: (value) => Validators.cargoAtual(value),
                      onSaved: (value) {
                        operadorCtrl.cargoDigitado = value!;
                      },
                    ),

                    // campo para adicionar o setor
                    SizedBox(height: 10),

                    CustomTextFormField(
                      labelText: Appstrings.setor,
                      hintText: Appstrings.setor,
                      validator: (value) => Validators.setorAtual(value),
                      onSaved: (value) {
                        operadorCtrl.setorDigitado = value!;
                      },
                    ),
                  
               
               CustomElevenButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  await operadorCtrl.salvarNobanco();
                  // atualiza a tela
                  setState(() {});

                  _formKey.currentState!.reset();
                }
              },
              textClick: 'Clique para salvar a informação',
            ),
          ]
               
               
                ),
              ),
           
            
            //SizedBox(height: 5)
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  CustomExpanded(
                    flex: 1,
                    text: Appstrings.id,
                    style: ApptextStyle.fontWeight,
                  ),
                  CustomExpanded(
                    flex: 3,
                    text: Appstrings.nome,
                    style: ApptextStyle.fontWeight,
                  ),
                  CustomExpanded(
                    flex: 2,
                    text: Appstrings.cargo,
                    style: ApptextStyle.fontWeight,
                  ),
                  CustomExpanded(
                    flex: 2,
                    text: Appstrings.setor,
                    style: ApptextStyle.fontWeight,
                  ),

                  CustomExpanded(
                    flex: 2,
                    text: Appstrings.deletar,
                    style: ApptextStyle.fontWeight,
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: operadorCtrl.listOperadores.length,
                itemBuilder: (context, index) {
                  // ignore: unused_local_variable
                  final operador = operadorCtrl.listOperadores[index];

                  return Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${operador.id}',
                            style: ApptextStyle.fontWeight,
                          ),
                        ),

                        Expanded(flex: 3, child: Text("${operador.nome}")),

                        Expanded(flex: 2, child: Text("${operador.cargo}")),

                        Expanded(flex: 2, child: Text("${operador.setor}")),

                        Expanded(
                          flex: 2,
                          child: CustomGesturedetector(
                            onTap: () async {
                              await operadorCtrl.deletar(operador);
                              setState(() {});
                            },
                            child: Icon(Appicons.deletar),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          
       ] ),
      ));
    
  }
}
