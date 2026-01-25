import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomContainer extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final VoidCallback? onTap;
  final Widget? appBar;

  const CustomContainer({
    super.key,
    this.color,
    this.width,
    this.height,
    this.decoration,
    this.onTap,
    this.appBar
   
   
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, 
      child: Container(
        
        width: width,
        height: height,
        decoration: decoration,
    
       
      )
    );
    
  }
}
