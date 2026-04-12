  
import 'package:flutter/material.dart';

 class Controllers {
  
  final controler = TextEditingController();
   final modelControler = TextEditingController();
   final nomeControler = TextEditingController();
   final emailControler = TextEditingController();
   final senhaControler = TextEditingController();
   final confirmSenha = TextEditingController();
   final cargoControler = TextEditingController();
   final pnControler = TextEditingController();
   final qtdsControler = TextEditingController();

   final setorControler = TextEditingController();
   final nameOperadorController = TextEditingController();
   final idControler = TextEditingController();


   void dispose(){
   controler.dispose();
     modelControler.dispose();
     nomeControler.dispose();
     emailControler.dispose();
     senhaControler.dispose();
     cargoControler.dispose();
     confirmSenha.dispose();
     pnControler.dispose();
     qtdsControler.dispose();
     setorControler.dispose();
     nameOperadorController.dispose();
     idControler.dispose(); 
   }

  }