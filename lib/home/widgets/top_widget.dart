import 'package:dixit_go/components/avatar_component.dart';
import 'package:flutter/material.dart';
import 'package:dixit_go/core/core.dart';

class TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dixit Go!',
              style: AppTextStyles.title,
            ),
            AvatarComponent(),
          ],
        ),
      ),
    );
  }
}
