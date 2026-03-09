import 'package:flutter/material.dart';

class UILayout {
  static const double xxsmall = 2;
  static const double xsmall = 4;
  static const double small = 8;
  static const double smallText = 12;
  static const double mediumText = 14;
  static const double medium = 16;
  static const double large = 24;
  static const double largeText = 20;
  static const double mlarge = 32;
  static const double xlarge = 48;
  static const double xxlarge = 96;
  static const double xxxlarge = 155;
  static const double bannerHeaderHeight = 271;
  static const double bannerTypeIconHeight = 204;

  static const double aspectRatio_16_9 = 16 / 9;
  static const double aspectRatio_3_2 = 3 / 2;
  static const double aspectRatio_4_3 = 4 / 3;
  static const double aspectRatio_1_1 = 1 / 1;
  static const double aspectRatio_3_3 = 3 / 4;
  static const double aspectRatio_2_3 = 2 / 3;

  static const double small_width_web = 960;
  static const double large_width_web = 1200;
  static const double width_web = 556;

  static dynamic deviceAspectRatio(BuildContext appContext) =>
      MediaQuery.of(appContext).devicePixelRatio;

  static bool isIpadScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 960;

  static bool isExactSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width == 960;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > 960 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
}
