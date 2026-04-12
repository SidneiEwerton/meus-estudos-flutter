
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/data/model/partnumber_model.dart';
import 'package:flutter_application_1/presentation/controllers/controllers.dart';
import 'package:flutter_application_1/core/theme/appstrings.dart';
import 'package:flutter_application_1/core/validatorsgeral/validators.dart';
import 'package:flutter_application_1/presentation/widgets/buttons/custom_eleven_button.dart';
import 'package:flutter_application_1/presentation/widgets/custom_text_form_field.dart';

class RegistroOrdens extends StatefulWidget {
  const RegistroOrdens({super.key});
  @override
  State<RegistroOrdens> createState() => _RegistroOrdensState();
}

class _RegistroOrdensState extends State<RegistroOrdens> {
  final _formKey = GlobalKey<FormState>();
  final controle = Controllers();
  final PartnumberModel ordens = PartnumberModel();
  List<Map<String, dynamic>> ordensAtual = [];

  @override
  void dispose() {
    controle.dispose();
    
    super.dispose();
  }

  //RegistroOrdens({super.key, required this.ordensAtual});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Proximas ordens'),
        centerTitle: true,
      ),
      body: 
          Form(
            key: _formKey,
        child:     SingleChildScrollView(

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              
              child:
              Column( children: [
               CustomTextFormField(
                controller: controle.pnControler,
                labelText: Appstrings.registerPn,
                hintText: Appstrings.registerPn,
                validator: (value) => Validators.partNumber(value),
                onSaved: (value) {
                  ordens.pn = value;
                },
              ),
           
          SizedBox(height: 20),
          CustomElevenButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() { 
               ordensAtual.add(Map<String, dynamic>.from(ordens.toMap())); });
                controle.pnControler.clear();
              }
               
               
              
            },
            textClick: 'Salvar ',
          ),

          Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Lista de Ordens", style: TextStyle(fontWeight: FontWeight.bold)),
              ),

         
           ListView.builder(
              shrinkWrap: true, // 3. OBRIGATÓRIO: Faz a lista não ser infinita
                physics: NeverScrollableScrollPhysics(), //
              itemCount: ordensAtual.length,
              itemBuilder: (context, index) {
                final orden = ordensAtual[index];
                return ListTile(
                  title: Text("PN: ${orden['PN']}"),
                  leading: const Icon(Icons.build),
                );
              },
            
            ),
          
          

        
      ]),
    )
    )));
    
  }
}
