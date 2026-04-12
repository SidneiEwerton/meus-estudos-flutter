
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/controllers/controllers.dart';
import 'package:flutter_application_1/presentation/telas/login_autorizado.dart';
import 'package:flutter_application_1/core/theme/appstrings.dart';
import 'package:flutter_application_1/core/validatorsgeral/validators_password.dart';
import 'package:flutter_application_1/presentation/widgets/buttons/custom_eleven_button.dart';
import 'package:flutter_application_1/presentation/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final validator = ValidatorsPassword();
  bool _senhaobscureText = true;
  bool _confirmSenhaText = true;

  final controllers = Controllers();

  @override
  void dispose() {
    controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pagina de cadastro de usuario',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body:
      SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: 
       Form(
        key: _formKey,
        child: Column(
          children: [
            Center(
              child: Container(
                // height: 500,
                // width: 500,
                child: Column(
                  children: [
                    //  cadastro de e-mail
                    CustomTextFormField(
                      
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Digite um e-mail',
                      hintText: 'E-mail',
                      controller: controllers.emailControler,
                      validator: (value) => ValidatorsPassword.email(value),
                    ),
                    SizedBox(height: 20),

                    // Cadastro de senha
                    CustomTextFormField(
                      prefixIcon: Icon(Icons.lock),
                      obscureText: _senhaobscureText,
                      sufixIcon: IconButton(
                        icon: Icon(
                          _senhaobscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _senhaobscureText = !_senhaobscureText;
                          });
                        },
                      ),
                      controller: controllers.senhaControler,
                      labelText: Appstrings.password,
                      hintText: Appstrings.password,
                      validator: (value) => ValidatorsPassword.password(value),
                    ),
                    SizedBox(height: 20),

                    // campo de confimação de senha
                    CustomTextFormField(
                      prefixIcon: Icon(Icons.lock),
                      obscureText: _confirmSenhaText,
                      controller: controllers.confirmSenha,
                      labelText: Appstrings.confirmPassword,
                      hintText: Appstrings.confirmPassword,
                      sufixIcon: IconButton(
                        icon: Icon(
                          _confirmSenhaText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _confirmSenhaText = !_confirmSenhaText;
                          });
                        },
                      ),

                      validator: (value) => ValidatorsPassword.confirmPassord(
                        controllers.senhaControler.text,
                        value,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomElevenButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('Tudo certo');

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginAutorizado(),
                            ),
                          );
                        }
                      }, 
                      textClick: 'Cadastar',
                    ),
                  ],
              ),
              ),
            
        )
          ]

        ))));
  }
}

        
       
  

