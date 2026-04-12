import 'package:flutter/material.dart';

 // ignore: must_be_immutable
 class CustomExpanded extends StatelessWidget {
 final int flex;
 final  String text;
 final  Color? color;
 final TextStyle? style;


  CustomExpanded({super.key,required  this.flex,required  this.text, this.color, this.style,  });
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(text,
      style: style,),
      
      );
  }
    


}
