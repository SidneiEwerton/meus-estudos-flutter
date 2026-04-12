import 'package:flutter/material.dart';

class CustomTextButtom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? backgroundColor;

  final FontWeight? fontWeight;

  const CustomTextButtom({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.fontWeight, this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontWeight: fontWeight),
        foregroundColor: color ?? Colors.blue,
      ),
      child: Text(text),
    );
  }
}
