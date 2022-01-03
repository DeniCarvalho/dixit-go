import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/extensions/responsive_extension.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.breeSerif(
    color: AppColors.primary,
    fontSize: 30.fontSize,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle subTitle = TextStyle(
    color: AppColors.primary,
    fontSize: 15.responsiveWidth,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle body = GoogleFonts.notoSans(
    color: AppColors.light,
    fontSize: 12.fontSize,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle bodyRed = GoogleFonts.notoSans(
    color: AppColors.danger,
    fontSize: 12.fontSize,
    fontWeight: FontWeight.w500,
  );
}
