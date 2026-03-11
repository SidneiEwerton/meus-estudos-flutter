 import 'package:contole_producao/validator/cadastros/models/maquinas.dart';
import 'package:contole_producao/validator/cadastros/models/ordens_producao.dart';
import 'package:contole_producao/validator/cadastros/models/tools.dart';


// cadastro de lista de maquina
class ListaMaquinas {
 
 
 final List<Maquinas> listaMaquinas = [];

  void adicionar(Maquinas maquina) {
    listaMaquinas.add(maquina);
  }

  void remover(int index) {
    listaMaquinas.removeAt(index);
  }
}

// cadastro de ordens de produção

class ListaOrdensProducao{
  final List<OrdensProducao>  ordens = [];
  void adicionarOrdem(OrdensProducao ordem ){
    ordens.add(ordem);
    
  }

  void remover(int index){
    ordens.removeAt(index);
  }
}

// cadastro de ferramentas

class listaTools{
  

final List<Tools> tool = [];

 

void adicionarFerramenta(Tools ferramenta){
  tool.add(ferramenta);
}

void removerFerramenta(int index){
  tool.removeAt(index);

}

}

