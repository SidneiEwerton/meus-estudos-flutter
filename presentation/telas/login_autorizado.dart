
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/controllers/controllers.dart';
import 'package:flutter_application_1/presentation/telas/home_page.dart';
import 'package:flutter_application_1/presentation/telas/register_page.dart';
import 'package:flutter_application_1/core/theme/appcolor.dart';
import 'package:flutter_application_1/core/theme/appstrings.dart';
import 'package:flutter_application_1/core/validatorsgeral/validators_password.dart';
import 'package:flutter_application_1/presentation/widgets/buttons/custom_eleven_button.dart';
import 'package:flutter_application_1/presentation/widgets/buttons/custom_text_eleven_button.dart';
import 'package:flutter_application_1/presentation/widgets/custom_text_form_field.dart';

class LoginAutorizado extends StatefulWidget {
  @override
  State<LoginAutorizado> createState() => _LoginAutorizadoState();
}

class _LoginAutorizadoState extends State<LoginAutorizado> {
  // final _validators = ValidatorsPassword();
  final _formKey = GlobalKey<FormState>();
  final _controle = Controllers();

  bool _obscurePassword = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.whithe,
        centerTitle: true,
        title: Text('UsiVale'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset_imagenscnc/usinagem.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // height: 200,
                    // width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.6),
                    ),

                    child: Form(
                      key: _formKey,
                      child:
                          //Padding(padding: EdgeInsetsGeometry.all(45)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(32),
                                child:
                                    // campo de e-mail
                                    CustomTextFormField(
                                      prefixIcon: Icon(Icons.email),
                                      borderRadius: BorderRadius.circular(12),

                                      //labelText: Appstrings.enter,
                                      hintText: Appstrings.loginEmail,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      validator: (value) =>
                                          ValidatorsPassword.email(value),
                                    ),
                              ),

                              //SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.all(32),
                                child:
                                    // Campo de senha
                                    CustomTextFormField(
                                      prefixIcon: Icon(Icons.lock),
                                      obscureText: _obscurePassword,
                                      sufixIcon: IconButton(
                                        icon: Icon(
                                          _obscurePassword
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscurePassword =
                                                !_obscurePassword;
                                          });
                                        },
                                      ),
                                      hintText: Appstrings.password,
                                      controller: _controle.senhaControler,

                                      validator: (value) =>
                                          ValidatorsPassword.password(value),
                                    ),
                              ),
                              SizedBox(height: 32),
                              CustomElevenButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print('OK');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                    );
                                  }
                                },
                                textClick: Appstrings.enter,
                              ),
                              SizedBox(height: 20),

                              // caminho para a tela de cadastro
                              CustomTextElevenButton(
                                labelText: 'Clique para se cadastrar',
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
