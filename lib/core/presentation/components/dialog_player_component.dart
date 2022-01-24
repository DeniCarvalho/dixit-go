import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../models/game_model.dart';
import '../../core.dart';
import '../../utils/extensions/responsive_extension.dart';

class DialogPlayerComponent extends StatefulWidget {
  final String title, text;
  final Widget details;
  final String img;
  final PlayerModel? user;

  const DialogPlayerComponent({
    Key? key,
    required this.title,
    required this.details,
    required this.text,
    required this.img,
    this.user,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<DialogPlayerComponent> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 20.responsiveWidth,
            top: 45 + 20.responsiveHeight,
            right: 20.responsiveWidth,
            bottom: 20.responsiveHeight,
          ),
          margin: EdgeInsets.only(top: 45.responsiveHeight),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: AppColors.secundary,
                offset: Offset(0, 0),
                blurRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 22.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15.responsiveHeight,
              ),
              widget.details,
              SizedBox(
                height: 22.responsiveHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Nav.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: AppColors.danger,
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Nav.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //     style: ElevatedButton.styleFrom(
              //       shape: CircleBorder(),
              //       primary: Colors.white,
              //       padding: const EdgeInsets.all(10.0),
              //     ),
              //     child: Container(
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(shape: BoxShape.circle),
              //       child: Icon(
              //         Icons.close,
              //         color: AppColors.primary,
              //       ),
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //     style: ElevatedButton.styleFrom(
              //       shape: CircleBorder(),
              //       primary: AppColors.danger,
              //       padding: const EdgeInsets.all(10.0),
              //     ),
              //     child: Container(
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(shape: BoxShape.circle),
              //       child: Icon(
              //         Icons.delete,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Positioned(
          left: 20.responsiveWidth,
          right: 20.responsiveWidth,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 45,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(45)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(45)),
                  child: Image(
                    image: widget.user?.getAvatar() ??
                        AssetImage(
                          AppImages().getAvatar(
                            widget.user?.pathAvatar ?? '',
                          ),
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
