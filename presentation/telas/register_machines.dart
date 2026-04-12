
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/data/repositorieimpl/maquinas_repositories_impl.dart';
import 'package:flutter_application_1/presentation/controllers/controllers.dart';
import 'package:flutter_application_1/presentation/controllers/maquina_controller.dart';
import 'package:flutter_application_1/core/theme/appcolor.dart';
import 'package:flutter_application_1/core/theme/appstrings.dart';
import 'package:flutter_application_1/presentation/validator/custom_positoned.dart';
import 'package:flutter_application_1/presentation/validator/formulario.dart';
import 'package:flutter_application_1/core/validatorsgeral/validators.dart';

class RegisterMachines extends StatefulWidget {
  final VoidCallback? onToggle;
  final VoidCallback? onDelete;

  const RegisterMachines({super.key, this.onToggle, this.onDelete});

  @override
  State<RegisterMachines> createState() => _RegisterMachineState();
}

class _RegisterMachineState extends State<RegisterMachines> {
  final controles = Controllers();
  final repo = MaquinasRepositoriesImpl();
  final _formKey = GlobalKey<FormState>();
  final maquinaCtrl = MaquinaController();
  bool operadorLogado = false; 
  // final maquinario = Maquinas();

  @override
  void initState() {

    super.initState();
    maquinaCtrl.carregarMaquinas().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    controles.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.blue,

      appBar: AppBar(
        backgroundColor: Appcolor.whithe,
        title: Center(child: Text(Appstrings.manufatura)),
      ),
      body: Column(
        key: _formKey,
        children: [
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              controles.nomeControler.clear();
              controles.modelControler.clear();
              final meuform = Formulario();

              meuform.formularioCadastro(
                context: context,
                controllers: controles,
                repo: repo,
                validador: Validators(),
                onSalvar: () async {

                  await maquinaCtrl.carregarMaquinas();
                  setState(() {});
                },
              );
            },

            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('asset_imagenscnc/MaquinasCentur.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const Text(
                  'Toque para adicionar uma maquina',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:
                    250, // Cada card terá no máximo 250 pixels de largura
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent:
                    150, // Isso fixa a ALTURA do card, independente da largura!
              ),
              
              // alterado por causa do banco de dados 
              itemCount: maquinaCtrl.listaMaquinas.length,
              itemBuilder: (context, index) {
                final maquina = maquinaCtrl.listaMaquinas[index];
                
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.settings,
                              size: 40,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              maquina.register,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              maquina.modelo,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 20,
                          ),
                          onPressed: () async {
                            await maquinaCtrl.excluir(maquina);
                            setState(() {
                              //repo.listaMaquinas.removeAt(index);
                            });
                          },
                        ),
                      ),
                      CustomPositoned(
                        top: 5,
                        left: 5, maquina: maquina ,
                      )
                      
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
