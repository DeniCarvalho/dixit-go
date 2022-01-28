import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core.dart';

/// TextCarousel Widget
class TextCarouselWidget extends StatefulWidget {
  final PageController? controller;

  /// List text carousel
  final List<String> list;

  /// Creates an [TextCarouselWidget]
  const TextCarouselWidget({
    Key? key,
    required this.list,
    this.controller,
  }) : super(key: key);

  @override
  State<TextCarouselWidget> createState() => _TextCarouselWidgetState();
}

class _TextCarouselWidgetState extends State<TextCarouselWidget> {
  late PageController pageController;

  @override
  void initState() {
    if (widget.controller != null) {
      pageController = widget.controller!;
    } else {
      pageController = PageController(keepPage: true);
    }
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  List<Widget> _list() {
    List<Widget> texts = [];
    for (var i = 0; i < widget.list.length; i++) {
      texts.add(
        Text(
          widget.list[i],
          style: GoogleFonts.breeSerif(
            fontSize: 18.fontSize,
            fontWeight: FontWeight.w100,
            height: 1.2.responsiveHeight,
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    return texts;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 64.responsiveHeight,
          child: PageView(
            controller: pageController,
            children: _list(),
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            dotHeight: 5.responsiveHeight,
            dotWidth: 10.responsiveWidth,
            activeDotColor: AppColors.primary,
            dotColor: AppColors.quaternary,
          ),
        ),
      ],
    );
  }
}
