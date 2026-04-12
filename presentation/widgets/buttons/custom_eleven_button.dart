
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/appcolor.dart';

class CustomElevenButton extends StatefulWidget {
  final VoidCallback onPressed;
  //final Appcolor color;
  final String textClick;
  

  const CustomElevenButton( {super.key, required this.onPressed, required this.textClick, });

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
        
        widget.textClick,
        style: TextStyle(fontWeight: FontWeight.bold, 
        color: Appcolor.whithe),
      ),
    );
  }
}
