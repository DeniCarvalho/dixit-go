import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core.dart';

class ButtonDefaultComponent extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? backgroundColor;
  final double fontSize;
  final VoidCallback action;
  final double widthFactor;
  final Color? shadowColor;
  final double elevation;
  const ButtonDefaultComponent({
    Key? key,
    required this.text,
    this.color,
    this.backgroundColor,
    this.fontSize = 15,
    required this.action,
    this.widthFactor = 0.8,
    this.shadowColor,
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            if (shadowColor != null)
              BoxShadow(
                color: shadowColor ?? AppColors.quinary,
                spreadRadius: -15,
                blurRadius: 50,
              )
          ],
        ),
        child: TextButton(
          child: Text(
            text,
            style: GoogleFonts.breeSerif(
              color: color ?? AppColors.light,
            ),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              (backgroundColor ?? Colors.transparent),
            ),
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? AppColors.contrastSecundary,
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 15.fontSize,
              ),
            ),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          onPressed: action,
        ),
      ),
    );
  }
}
