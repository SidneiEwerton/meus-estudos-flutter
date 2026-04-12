import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/maquinas_model.dart';
import 'package:flutter_application_1/data/model/operador_model.dart';
import 'package:flutter_application_1/presentation/controllers/controllers.dart';
import 'package:flutter_application_1/presentation/controllers/maquina_controller.dart';
import 'package:flutter_application_1/data/daos/daos_operador.dart';
import 'package:flutter_application_1/data/daos/daosloga_operador.dart';
import 'package:flutter_application_1/presentation/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomPositoned extends StatefulWidget {
  double? top;
  double? right;
  double? left;
  double? height;
  double? width;
  double? bottom;
  final MaquinasModel maquina;

  CustomPositoned({
    super.key,
    this.top,
    this.right,
    this.left,
    this.height,
    this.width,
    this.bottom,
    required this.maquina,
  });

  @override
  State<CustomPositoned> createState() => _CustomPositonedState();
}

class _CustomPositonedState extends State<CustomPositoned> {
  final _formKey = GlobalKey<FormState>();
  final operadorControle = DaoslogaOperador();
  final dao = DaosOperador();
  final maquinaControle = MaquinaController();

  final controle = Controllers();
  final operador = OperadorModel(id: 0, cargo: '', setor: '', nome: '');

  @override
  void initState() {
    super.initState();
    operadorControle.getOperador().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       child: IconButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text('Logar operador'),
//                 actions: [
//                   GestureDetector(
//                     onTap: () => {controle.idControler.clear()},
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           TextButton(
//                             onPressed: () {},
//                             child: CustomTextFormField(
//                               controller: controle.idControler,
//                               onSaved: (value) =>
//                                   operadorControle.getOperador(),
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () async {
//                               final String textoDigitado =
//                                   controle.idControler.text;

//                               final int? idConvertido = int.tryParse(
//                                 textoDigitado,
//                               );
//                               if(idConvertido != null){
//                                 final existe = await dao.getOperadorPorId(idConvertido);
                              
//                               if (idConvertido != null) {
//                                 await maquinaControle.registerOperador(
//                                   widget.maquina,
//                                   idConvertido,
//                                 );
                             
//                                 setState(() {
//                                   widget.maquina.estaLogada = 1;
//                                   widget.maquina.operador_id = idConvertido; // Guarda quem logou
//                                 });
//                                 controle.idControler.clear();
//                               Navigator.of(context).pop();
//                               }} 
//                             },
//                             child: Text('Logar'),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         icon: Icon(
//           widget.maquina.estaLogada == 1
//               ? Icons.lock_clock
//               : Icons.app_registration,
//               color: widget.maquina.estaLogada == 1 ? Colors.green : Colors.black
//         ),
//       ),
//     );
//   }
// }
@override
  Widget build(BuildContext context) {
    return Positioned(
      child: IconButton(
        onPressed: () {
          // --- LÓGICA DE ALTERNÂNCIA (LOGIN / LOGOUT) ---
          if (widget.maquina.estaLogada == 1) {
            // SE JÁ ESTIVER LOGADO: Pergunta se quer deslogar
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Encerrar Sessão"),
                content: Text("Deseja deslogar da máquina ${widget.maquina.modelo}?"),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text("Não")),
                  ElevatedButton(
                    onPressed: () async {
                      // Aqui chamamos o logout (zerando no banco)
                      await maquinaControle.removerOperador(widget.maquina);
                     // await maquinaControle.registerOperador(widget.maquina, 0); 
                      setState(() {
                        widget.maquina.estaLogada = 0;
                        widget.maquina.operador_id = null;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Sim, Sair"),
                  ),
                ],
              ),
            );
          } else {
            // SE NÃO ESTIVER LOGADO: Abre a janela de login
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Logar operador'),
                  actions: [
                    GestureDetector(
                      onTap: () => controle.idControler.clear(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller: controle.idControler,
                              labelText: "ID do Operador",
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () async {
                                final String textoDigitado = controle.idControler.text;
                                final int? idConvertido = int.tryParse(textoDigitado);

                                if (idConvertido != null) {
                                  // --- VALIDAÇÃO DE EXISTÊNCIA ---
                                  final existe = await dao.getOperadorPorId(idConvertido);

                                  if (existe != null) {
                                    // OPERADOR EXISTE: Faz o login
                                    await maquinaControle.registerOperador(widget.maquina, idConvertido);
                                    setState(() {
                                      widget.maquina.estaLogada = 1;
                                      widget.maquina.operador_id = idConvertido;
                                    });
                                    controle.idControler.clear();
                                    Navigator.of(context).pop();
                                  } else {
                                    // OPERADOR NÃO EXISTE: Avisa o usuário
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Operador não encontrado no sistema!'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const Text('Logar'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
        icon: Icon(
          widget.maquina.estaLogada == 1 ? Icons.person_off : Icons.person_add,
          color: widget.maquina.estaLogada == 1 ? Colors.green : Colors.black,
        ),
      ),
      );
  }}