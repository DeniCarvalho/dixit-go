import 'package:flutter/material.dart';

import '../core.dart';

class ButtonIconComponent extends StatelessWidget {
  final Widget icon;
  final VoidCallback action;
  final double size;
  final Color? color;

  const ButtonIconComponent({
    Key? key,
    required this.icon,
    required this.action,
    this.size = 40,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.responsiveWidth,
      height: size.responsiveHeight,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          primary: color ?? AppColors.light,
          padding: const EdgeInsets.all(0.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: icon,
        ),
      ),
    );
  }
}
