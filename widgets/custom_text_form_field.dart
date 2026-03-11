import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLine;
  final int? minLine;
  final String? labelText;
  final String? hintText;
  final Widget? sufixIcon;
  final Widget? prefixIcon;
  final TextStyle? style;
  final bool enable;
  final BorderRadius? borderRadius;
  final Color? color;
  final String? Function(String?)? validator;
  final Decoration? decoration;
  final  bool obscureText ;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.maxLine = 1,
    this.minLine,
    this.labelText,
    this.hintText,
    this.sufixIcon,
    this.prefixIcon,
    this.style,
    this.enable = true,
    this.borderRadius,
    this.color,
    this.validator,
    this.decoration, 
    this.obscureText = false,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      
      maxLines: maxLine,
      minLines: minLine,
      validator: validator,
      obscureText: obscureText,
      
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        enabled: enable,   
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12) ,
        ),
        
      ),
      
         
    );
  }
}
