import 'dart:io';

import 'package:contole_producao/telas/login/login_autorizado.dart';

import 'package:flutter/material.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:LoginAutorizado(),
    );
  }
}

