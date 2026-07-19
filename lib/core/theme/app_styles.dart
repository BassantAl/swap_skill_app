import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/utils/size_config.dart';

class AppStyles {
  AppStyles._();

  static TextStyle bold38(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontsize(fontsize: 38, context: context),
      color: AppColors.primary,
    );
  }

  static TextStyle medium20(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontsize(fontsize: 20, context: context),
      color: Color(0xff464555),
    );
  }
}

double getResponsiveFontsize({
  required double fontsize,
  required BuildContext context,
}) {
  double scaleFactor = getScaleFactor(context);
  double resposiveFontsize = fontsize * scaleFactor;

  double lowerLimit = fontsize * 0.8;
  double upperLimit = fontsize * 1.2;
  return resposiveFontsize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 500;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1400;
  }
}
