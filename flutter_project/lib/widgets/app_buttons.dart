import 'package:flutter/material.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';

// ignore: must_be_immutable
class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  String text;
  bool isIcon;
  IconData icon;
  final Color borderColor;

  AppButtons({
    super.key,
    this.text = "Hi",
    this.icon = Icons.handyman,
    /*this.icon,*/
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon
          ? Icon(
              icon,
              color: color,
            )
          : Center(
              child: AppText(
                text: text,
                color: Colors.black,
              ),
            ),
    );
  }
}
