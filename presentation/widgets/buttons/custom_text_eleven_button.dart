import 'package:flutter/material.dart';

class CustomTextElevenButton extends StatefulWidget {
  final String labelText;
  final VoidCallback onPressed;
  final Color? color;

  const CustomTextElevenButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.color,
  });

  @override
  State<CustomTextElevenButton> createState() => _CustomTextElevenButtonState();
}

@override
class _CustomTextElevenButtonState extends State<CustomTextElevenButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.labelText,
        style: TextStyle(fontWeight: FontWeight.bold, color: widget.color),
      ),
    );
  }
}
