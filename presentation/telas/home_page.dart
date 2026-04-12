import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/appstrings.dart';
import 'package:flutter_application_1/presentation/widgets/buttons/custom_route_pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina inicial(opções)')),

      body: ListView(
        children: [
          CustomRoutePages(route: '/maquinas', label: Appstrings.manufatura),
          CustomRoutePages(route: '/registro PCP:', label: Appstrings.ordensServico),
          CustomRoutePages(route: '/registro funcionario',label:  Appstrings.funcionarios)
        ],


      ));




  }}

