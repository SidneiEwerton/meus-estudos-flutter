import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomContainer extends StatelessWidget {
  final Color? color;
  final double width;
  final double height;
  final BoxDecoration? decoration;
  final VoidCallback? onTap;
  final String text;
  final String image;
  final double borderRadius;
  final BoxFit imageFit;

  const CustomContainer({
    super.key,
    this.color,
  required this.width,
  required this.height,
    this.decoration,
    this.onTap,
  required this.text,
  required this.image,
  required this.borderRadius,
    this.imageFit = BoxFit.cover,
  
   
   
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, 
      child: Container( 
        width: width,
        height: height,
        
        
       // width: width,
        //height: height,
        decoration: BoxDecoration( color: color?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        ),
        child:(
          Column(
        mainAxisSize: MainAxisSize.min,
        children: 
        [  
        Text(text),
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: 
        Image.asset(image, fit: imageFit,width: width,height: height ,)),
      ])),
    
       
      ),
    );
    
  }
}
