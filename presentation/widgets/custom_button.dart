import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final Text? text;
  final void Function() onPressed;
  final ButtonStyle? style;
  final Widget? icon;
  final BorderRadius? borderRadius;
  final Icon? sufixIcon;
  final Widget? label;
  final Color? backgroundColor;


  const CustomButton({super.key, this.text,this.borderRadius,required this.onPressed,this.icon
  ,this.style,this.sufixIcon,this.label,this.backgroundColor});

  
  


  @override
  Widget build(BuildContext context) {
    return 
     ElevatedButton.icon(onPressed: onPressed,icon: icon ,
    label:label ?? text ?? const Text(''),
    style: style,
    
    );
    
  }

}