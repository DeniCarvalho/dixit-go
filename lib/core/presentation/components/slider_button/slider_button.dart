import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/extensions/responsive_extension.dart';

class SliderButton extends StatefulWidget {
  ///To make button more customizable add your child widget
  final Widget? child;

  ///Sets the radius of corners of a button.
  final double radius;

  ///Use it to define a height and width of widget.
  final double height;
  final double width;
  final double? buttonSize;

  ///Use it to define a color of widget.
  final Color backgroundColor;
  final Color baseColor;
  final Color highlightedColor;
  final Color buttonColor;
  final Color buttonDisableColor;

  ///Change it to gave a label on a widget of your choice.
  final Text? label;

  ///Gives a alignment to a slider icon.
  final Alignment alignLabel;
  final BoxShadow? boxShadow;
  final Widget? icon;
  final Function action;

  ///Make it false if you want to deactivate the shimmer effect.
  final bool shimmer;

  ///Make it false if you want maintain the widget in the tree.
  final bool dismissible;

  final bool vibrationFlag;

  ///The offset threshold the item has to be dragged in order to be considered
  ///dismissed e.g. if it is 0.4, then the item has to be dragged
  /// at least 40% towards one direction to be considered dismissed
  final double dismissThresholds;

  final bool disable;

  final FeedbackType type;
  final List<BoxShadow>? boxShadowContainer;

  const SliderButton({
    Key? key,
    required this.action,
    this.radius = 100,
    this.boxShadow,
    this.child,
    this.vibrationFlag = false,
    this.shimmer = true,
    this.height = 70,
    this.buttonSize,
    this.width = 250,
    this.alignLabel = const Alignment(0.6, 0),
    this.backgroundColor = const Color(0xffe0e0e0),
    this.baseColor = Colors.black87,
    this.buttonColor = Colors.white,
    this.buttonDisableColor = Colors.grey,
    this.highlightedColor = Colors.white,
    this.label,
    this.icon,
    this.dismissible = true,
    this.dismissThresholds = 0.75,
    this.disable = false,
    this.type = FeedbackType.success,
    this.boxShadowContainer,
  })  : assert((buttonSize ?? 60) <= (height)),
        super(key: key);

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  late bool flag;

  @override
  void initState() {
    super.initState();
    flag = true;
  }

  @override
  Widget build(BuildContext context) {
    return flag == true
        ? _control()
        : widget.dismissible == true
            ? Container()
            : _control();
  }

  Widget _control() => Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
          boxShadow: widget.boxShadowContainer,
        ),
        alignment: Alignment.centerLeft,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              alignment: widget.alignLabel,
              child: widget.shimmer && !widget.disable
                  ? Shimmer.fromColors(
                      baseColor: widget.baseColor,
                      highlightColor: widget.highlightedColor,
                      child: widget.label ?? const Text(''),
                    )
                  : widget.label,
            ),
            widget.disable
                ? Container(
                    width: widget.width - widget.height,
                    height: widget.height,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: (widget.height -
                              (widget.buttonSize == null
                                  ? widget.height
                                  : widget.buttonSize!)) /
                          2.responsiveWidth,
                    ),
                    child: widget.child ??
                        Container(
                          height: widget.buttonSize ?? widget.height,
                          width: widget.buttonSize ?? widget.height,
                          decoration: BoxDecoration(
                            boxShadow: widget.boxShadow != null
                                ? [
                                    widget.boxShadow!,
                                  ]
                                : null,
                            color: widget.buttonDisableColor,
                            borderRadius: BorderRadius.circular(widget.radius),
                          ),
                          child: Center(child: widget.icon),
                        ),
                  )
                : Dismissible(
                    key: const Key("cancel"),
                    direction: DismissDirection.startToEnd,
                    confirmDismiss: (value) async {
                      try {
                        widget.action();
                        bool hasVibrator = await Vibrate.canVibrate;
                        if (widget.vibrationFlag && hasVibrator) {
                          Vibrate.vibrate();
                        }
                      } catch (e) {
                        // ignore: avoid_print
                        print(e);
                      }
                    },
                    dismissThresholds: {
                      DismissDirection.startToEnd: widget.dismissThresholds
                    },
                    child: Container(
                      width: widget.width - widget.height,
                      height: widget.height,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                        left: 3.5.responsiveWidth,
                        top: 3.5.responsiveHeight,
                        bottom: 3.5.responsiveWidth,
                      ),
                      child: widget.child ??
                          Container(
                            height: widget.buttonSize ?? widget.height,
                            width: (widget.buttonSize ?? widget.height) -
                                8.responsiveWidth,
                            decoration: BoxDecoration(
                              boxShadow: widget.boxShadow != null
                                  ? [
                                      widget.boxShadow!,
                                    ]
                                  : null,
                              color: widget.buttonColor,
                              borderRadius:
                                  BorderRadius.circular(widget.radius),
                            ),
                            child: Center(child: widget.icon),
                          ),
                    ),
                  ),
          ],
        ),
      );
}
