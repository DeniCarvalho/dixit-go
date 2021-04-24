import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                vertical: 12,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              AppColors.contrastPrimary,
            ),
          ),
          child: Text(
            "Continuar",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
