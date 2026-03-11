
import 'package:contole_producao/theme/appcolor.dart';
import 'package:contole_producao/theme/appstrings.dart';
import 'package:flutter/material.dart';

class CustomElevenButton extends StatefulWidget {
  final VoidCallback onPressed;
  //final Appcolor color;
  

  const CustomElevenButton( {super.key, required this.onPressed, });

  @override
  State<CustomElevenButton> createState() => _CustomElevenButtonState();
}

@override
class _CustomElevenButtonState extends State<CustomElevenButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Appcolor.purple),
      onPressed: widget.onPressed,
      child: Text(
        
         Appstrings.enter,
        style: TextStyle(fontWeight: FontWeight.bold, 
        color: Appcolor.whithe),
      ),
    );
  }
}
