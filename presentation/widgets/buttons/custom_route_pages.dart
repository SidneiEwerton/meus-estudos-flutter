import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/theme/apptext_style.dart';

class CustomRoutePages extends StatelessWidget {
  final String route;
  final String label;

  const CustomRoutePages({super.key, required this.route, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Chip(label: Text(label, style: ApptextStyle.fontWeight)),
      ),
    );
  }
}
