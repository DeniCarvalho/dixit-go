import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

class FooterWidget extends StatelessWidget {
  final Function() next;
  final bool loading;
  final dynamic rectGetterKey;
  FooterWidget({
    required this.next,
    required this.rectGetterKey,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: next,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !loading
                  ? Text(
                      "Iniciar partida",
                      style: TextStyle(fontSize: 18),
                    )
                  : Container(
                      height: 20.0,
                      width: 20.0,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 1.5,
                        valueColor: new AlwaysStoppedAnimation<Color>(
                          AppColors.contrastPrimary,
                        ),
                      ),
                    ),
              RectGetter(
                key: rectGetterKey,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
