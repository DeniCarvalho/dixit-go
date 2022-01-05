import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';

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
          shape: CircleBorder(),
          primary: color ?? AppColors.light,
          padding: const EdgeInsets.all(0.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: icon,
        ),
      ),
    );
  }
}
