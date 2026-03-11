import 'package:contole_producao/controllers/controllers.dart';
import 'package:contole_producao/telas/login/home_page.dart';
import 'package:contole_producao/telas/login/register_page.dart';
import 'package:contole_producao/theme/appcolor.dart';
import 'package:contole_producao/theme/appstrings.dart';
import 'package:contole_producao/validator/validators_password.dart';
import 'package:contole_producao/widgets/buttons/custom_eleven_button.dart';
import 'package:contole_producao/widgets/buttons/custom_text_eleven_button.dart';
import 'package:contole_producao/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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
    // TODO: implement dispose
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                width: 500,
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

                          // campo de e-mail
                          CustomTextFormField(
                            prefixIcon: Icon(Icons.email),
                            borderRadius: BorderRadius.circular(12),


                            //labelText: Appstrings.enter,
                            hintText: Appstrings.loginEmail,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            validator: (value) => ValidatorsPassword.email(value) ,
                          ),
                          SizedBox(height: 16),

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
                                _obscurePassword = !_obscurePassword;
                              });
                              },
                            ),
                            hintText: Appstrings.password,
                            controller: _controle.senhaControler,
                            
                            validator: (value) => ValidatorsPassword.password(value),
                             ),
                          SizedBox(height: 32),
                          CustomElevenButton(
                            
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                print('OK');
                                Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                              }
                             
                              
                            },
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
    );
  }
}
