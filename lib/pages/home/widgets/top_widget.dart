import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../../../components/components.dart';

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
        padding: EdgeInsets.only(
          top: 60.responsiveHeight,
          bottom: 50.responsiveHeight,
        ),
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.responsiveWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LogoComponent(height: 60.responsiveHeight),
              AvatarComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
