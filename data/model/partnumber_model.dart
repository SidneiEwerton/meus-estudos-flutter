import 'package:flutter_application_1/domain/entities/partynumber.dart';

class PartnumberModel extends Partynumber {
  String? pn;
  int? numeroOS;

  PartnumberModel({this.pn, this.numeroOS}) : 
  super(numeroOS: numeroOS, pn: pn);

  Map<String,dynamic> toMap(){
    return {
      'PN':pn,
      'numeroOS': numeroOS,
      };
  }

  factory PartnumberModel.fromMap(Map<String,dynamic> map ){
    return PartnumberModel(
      pn: map['PN'],
      numeroOS: map['numeroOS'],
    );
  }
}
