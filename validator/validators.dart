class Validators {

// validador de Part number

static String? partNumber(String? value){

  final pnValue = value?.trim();

  if(pnValue == null || pnValue.isEmpty){
    return 'Cadastre o PN antes da OS';
  }
  final regExp = RegExp(r'^\d{8}$ ');

  if(!regExp.hasMatch(pnValue)){
    return 'O PN deve conter 8 numeros';
  }
  return null;
}

// Validador de Ordens de serviço

static String? ordensServico(String? value){
final osValue = value?.trim();

  if(osValue == null || osValue.isEmpty){
    return 'A OS é obrigatorio';

  }
  final regExp = RegExp(r'^\d{6}$');

  if(!regExp.hasMatch(osValue)){
    return 'A OS deve conter 6 numeros';
  }
  return null;
}

// validador de cadastro de  maquinas 


static String? numberMachine(String? value ){
final managerValue = value?.trim();


if(managerValue == null || managerValue.isEmpty){
  return 'O numero da maquina  é obrigatorio';
}

final regExp = RegExp(r'^\d{4}$');
if(!regExp.hasMatch(managerValue)){
  return 'A maquina deve conter 4 numeros ';
};
return null;

}

static String? nameMachine(String? value){

final nameValue = value?.trim();

  if(nameValue == null || nameValue.isEmpty){
    return 'Precisa do nome da maquina';
  }

  final name = RegExp(r'^[a-zA-z]{2,10}[0-9]{2,7}$');
  if(!name.hasMatch(nameValue)){
  return 'A maquina deve ter min 2 letras e max 10 e min 2 numeros e max 7';

  };
return null;
}

// validador de ferramentas 

static String? toolsRegister(String? value){

  final toolValue = value?.trim();

  if(toolValue == null || toolValue.isEmpty){
    return 'Digite o nome da Ferramenta  ';
  }

  final register = RegExp(r'^[\w\s]{4,32}$');

  if(!register.hasMatch(toolValue)){
    return 'A ferramenta deve ter no min 4 letras e no maximo 32';
  }
  return null;


}


}





