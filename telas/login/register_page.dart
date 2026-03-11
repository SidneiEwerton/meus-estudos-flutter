import 'package:contole_producao/controllers/controllers.dart';
import 'package:contole_producao/telas/login/login_autorizado.dart';
import 'package:contole_producao/validator/validators_password.dart';
import 'package:contole_producao/widgets/buttons/custom_eleven_button.dart';
import 'package:contole_producao/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Center(
              child: Container(
                height: 500,
                width: 500,
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
                      labelText: 'senha',
                      hintText: 'Digite a senha ',
                      validator: (value) => ValidatorsPassword.password(value),
                    ),
                    SizedBox(height: 20),

                    // campo de confimação de senha
                    CustomTextFormField(
                      prefixIcon: Icon(Icons.lock),
                      obscureText: _confirmSenhaText,
                      controller: controllers.confirmSenha,
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
