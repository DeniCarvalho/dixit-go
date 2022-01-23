// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../../../models/game_model.dart';

class PlayerEmptyWidget extends StatefulWidget {
  final int index;
  final PlayerModel? user;
  const PlayerEmptyWidget({
    Key? key,
    required this.index,
    this.user,
  }) : super(key: key);

  @override
  _PlayerEmptyWidgetState createState() => _PlayerEmptyWidgetState();
}

class _PlayerEmptyWidgetState extends State<PlayerEmptyWidget>
    with SingleTickerProviderStateMixin {
  late final _GradientPainter painter = _GradientPainter(
    strokeWidth: 3,
    radius: 50,
    gradient:
        const LinearGradient(colors: [AppColors.tertiary, AppColors.tertiary]),
  );

  late double _scale = 0.0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.05,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Padding(
      padding: EdgeInsets.only(top: 20.0.responsiveHeight),
      child: Column(
        children: [
          CustomPaint(
            painter: painter,
            child: Container(
              height: 65.responsiveHeight,
              width: 65.responsiveWidth,
              color: Colors.transparent,
              child: Center(
                child: widget.user != null
                    ? GestureDetector(
                        onTap: _tap,
                        onTapDown: _tapDown,
                        onTapUp: _tapUp,
                        child: Transform.scale(
                          scale: _scale,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.tertiary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  50.0,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image(
                                image: widget.user?.getAvatar() ??
                                    AssetImage(
                                      AppImages().getAvatar(
                                        widget.user?.pathAvatar ?? '',
                                      ),
                                    ),
                                height: 60.responsiveHeight,
                                width: 60.responsiveWidth,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Text(
                        (widget.index + 1).toString(),
                        style: AppTextStyles.body,
                      ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _tap();
            },
            child: Container(
              padding: EdgeInsets.only(top: 8.responsiveHeight),
              child: Text(
                widget.user?.username ?? '--',
                style: AppTextStyles.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _tap() {
    _controller.forward().whenComplete(() {
      _controller.reverse().whenComplete(() {
        openDetail();
      });
    });
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void openDetail() {
    if (widget.user == null) return;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogPlayerComponent(
            title: "Jogador ${(widget.index + 1)}",
            user: widget.user,
            details: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Nome",
                      style: AppTextStyles.body,
                    ),
                    Text(
                      widget.user?.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 12.responsiveHeight,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Email",
                      style: AppTextStyles.body,
                    ),
                    Text(
                      widget.user?.email ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 12.responsiveHeight,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Usuário",
                      style: AppTextStyles.body,
                    ),
                    Text(
                      widget.user?.username ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            text: "Fechar",
            img: AppImages.avatar4,
          );
        });
    // showModal<void>(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return _ExampleAlertDialog();
    //   },
    // );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint()..style = PaintingStyle.fill;
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {required double strokeWidth,
      required double radius,
      required Gradient gradient})
      : strokeWidth = strokeWidth,
        radius = radius,
        gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect = RRect.fromRectAndRadius(
      outerRect,
      Radius.circular(radius),
    );

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(
      strokeWidth,
      strokeWidth,
      size.width - strokeWidth * 2,
      size.height - strokeWidth * 2,
    );
    var innerRRect = RRect.fromRectAndRadius(
      innerRect,
      Radius.circular(radius - strokeWidth),
    );

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
