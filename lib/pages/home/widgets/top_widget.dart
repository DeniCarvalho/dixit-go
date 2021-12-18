import 'package:dixit_go/components/avatar_component.dart';
import 'package:dixit_go/components/logo_component.dart';
import 'package:flutter/material.dart';

class TopWidget extends StatelessWidget {
  final bool visible;
  TopWidget({
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 400),
      child: Container(
        width: double.infinity,
        height: 150,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LogoComponent(height: 50),
              AvatarComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
