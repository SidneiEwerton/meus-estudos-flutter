import 'package:flutter/material.dart';

class CustomGesturedetector extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final VoidCallback? onlongPress;
  final VoidCallback? ondoubleTap;

  const CustomGesturedetector({
    super.key,
    this.onTap,
    this.onlongPress,
    this.ondoubleTap,
     this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onlongPress,
      onDoubleTap: ondoubleTap,
      child: child,

      



    );
    
  }
}
