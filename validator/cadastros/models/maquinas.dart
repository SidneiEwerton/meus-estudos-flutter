class Maquinas {
  final int? id;
  final String register;
  final String modelo;

  Maquinas({required this.register, 
  required this.modelo, this.id});


// usar tomap para transformar a classe em um mapa para salvar no banco

Map<String,dynamic>toMap(){
  return {
    'id': id,
    'register': register,
    'modelo': modelo,
  };
}

// pegar o mapa e transfrmar em um objeto em dart 

factory Maquinas.fromMap(Map<String,dynamic>map){
  return Maquinas(
    id : map['id'],
    register: map['register'],
    modelo: map['modelo'],
  );

}




}
