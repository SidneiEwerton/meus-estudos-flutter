import 'dart:io';



import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/telas/login_autorizado.dart';
import 'package:flutter_application_1/presentation/telas/register_machines.dart';
import 'package:flutter_application_1/presentation/telas/register_operador.dart';
import 'package:flutter_application_1/presentation/telas/registro_ordens.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // codigo para rodar windows ou linux
  if(Platform.isWindows || Platform.isLinux){
    // inicializa o banco de dados
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi; 

  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contole de produção',
      initialRoute: '/',
        routes:{
       '/maquinas': (context)=> const RegisterMachines(),
       '/registro PCP:': (context)=>  RegistroOrdens(),
       '/registro funcionario': (context)=>  RegisterOperador()},
      theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:LoginAutorizado(),
    );
  }
}


