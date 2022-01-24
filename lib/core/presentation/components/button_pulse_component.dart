import 'package:flutter/material.dart';

import '../../core.dart';

class ButtonPulseComponent extends StatefulWidget {
  const ButtonPulseComponent({Key? key}) : super(key: key);

  @override
  _ButtonPulseComponentState createState() => _ButtonPulseComponentState();
}

class _ButtonPulseComponentState extends State<ButtonPulseComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 8.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: Colors.white,
        padding: const EdgeInsets.all(0.0),
      ),
      child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  for (var i = 0; i < 3; i++)
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(_animationController.value / 2),
                      spreadRadius: _animation.value * i,
                    )
                ],
              ),
              child: Icon(
                Icons.group_add,
                color: AppColors.primary,
                size: 28.fontSize,
              ),
            );
          }),
    );
  }
}
