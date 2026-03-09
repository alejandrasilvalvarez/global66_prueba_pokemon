import 'dart:ui';

enum AppButtonState {
  buttonPrimary(Color.fromRGBO(30, 136, 229, 1)),
  buttonPrimaryHover(Color.fromRGBO(25, 118, 210, 1)),
  buttonPrimaryPressed(Color.fromRGBO(21, 101, 192, 1)),
  buttonPrimaryDisabled(Color.fromRGBO(224, 224, 224, 1)),

  buttonPrimaryDefaultText(Color.fromRGBO(250, 250, 250, 1)),
  buttonPrimaryHoverText(Color.fromRGBO(250, 250, 250, 1)),
  buttonPrimaryPressedText(Color.fromRGBO(250, 250, 250, 1)),
  buttonPrimaryDisabledText(Color.fromRGBO(158, 158, 158, 1)),

  buttonSecondary(Color.fromRGBO(238, 238, 238, 1)),
  buttonSecondaryHover(Color.fromRGBO(224, 224, 224, 1)),
  buttonSecondaryPressed(Color.fromRGBO(214, 214, 214, 1)),
  buttonSecondaryDisabled(Color.fromRGBO(224, 224, 224, 1));

  const AppButtonState(this.color);
  final Color color;
}

enum ButtonTextColors {
  buttonTextPrimaryDef(Color.fromRGBO(31, 73, 182, 1)),
  buttonTextPrimaryHover(Color.fromRGBO(22, 52, 129, 1)),
  buttonTextPrimaryPressed(Color.fromRGBO(76, 109, 197, 1)),
  buttonTextPrimaryDisabled(Color.fromRGBO(129, 134, 154, 1));

  const ButtonTextColors(this.color);
  final Color color;
}

enum TextColors {
  textPrimary(Color.fromRGBO(18, 18, 18, 1)),
  textSecondary(Color.fromRGBO(66, 66, 66, 1));

  const TextColors(this.color);
  final Color color;
}

enum Azul {
  normal(Color.fromRGBO(23, 62, 165, 1)),
  semilight(Color.fromRGBO(69, 101, 183, 1));

  const Azul(this.color);
  final Color color;
}

enum TapBar {
  borderTop(Color.fromRGBO(224, 224, 224, 1)),
  iconActive(Color.fromRGBO(21, 101, 192, 1)),
  iconDefault(Color.fromRGBO(66, 66, 66, 1));

  const TapBar(this.color);
  final Color color;
}

enum ElementStatusColors {
  statusWaterPrimary(Color.fromRGBO(33, 150, 243, 1)),
  statusDragonPrimary(Color.fromRGBO(0, 172, 193, 1)),
  statusElectricPrimary(Color.fromRGBO(253, 216, 53, 1)),
  statusHadaPrimary(Color.fromRGBO(233, 30, 99, 1)),
  statusGhostPrimary(Color.fromRGBO(142, 36, 170, 1)),
  statusFirePrimary(Color.fromRGBO(255, 152, 0, 1)),
  statusIcePrimary(Color.fromRGBO(61, 139, 255, 1)),
  statusGrassPrimary(Color.fromRGBO(139, 195, 74, 1)),
  statusBugPrimary(Color.fromRGBO(67, 160, 71, 1)),
  statusFightingPrimary(Color.fromRGBO(229, 57, 53, 1)),
  statusNormal(Color.fromRGBO(84, 110, 122, 1)),
  statusSteel(Color.fromRGBO(84, 110, 122, 1)),
  statusDark(Color.fromRGBO(84, 110, 122, 1)),
  statusRockPrimary(Color.fromRGBO(121, 85, 72, 1)),
  statusPsychicPrimary(Color.fromRGBO(103, 58, 183, 1)),
  statusGroundPrimary(Color.fromRGBO(255, 179, 0, 1)),
  statusVenenoPrimary(Color.fromRGBO(156, 39, 176, 1)),
  statusFlyingPrimary(Color.fromRGBO(0, 188, 212, 1)),

  statusWaterTransparent(Color.fromRGBO(33, 150, 243, 0.5)),
  statusDragonTransparent(Color.fromRGBO(0, 172, 193, 0.5)),
  statusElectricTransparent(Color.fromRGBO(253, 216, 53, 0.5)),
  statusHadaTransparent(Color.fromRGBO(233, 30, 99, 0.5)),
  statusGhostTransparent(Color.fromRGBO(142, 36, 170, 0.5)),
  statusFireTransparent(Color.fromRGBO(255, 152, 0, 0.5)),
  statusIceTransparent(Color.fromRGBO(61, 139, 255, 0.5)),
  statusGrassTransparent(Color.fromRGBO(139, 195, 74, 0.5)),
  statusBugTransparent(Color.fromRGBO(67, 160, 71, 0.5)),
  statusFightingTransparent(Color.fromRGBO(229, 57, 53, 0.5)),
  statusNormalTransparent(Color.fromRGBO(84, 110, 122, 0.5)),
  statusSteelTransparent(Color.fromRGBO(84, 110, 122, 0.5)),
  statusDarkTransparent(Color.fromRGBO(84, 110, 122, 0.5)),
  statusRockTransparent(Color.fromRGBO(121, 85, 72, 0.5)),
  statusPsychicTransparent(Color.fromRGBO(103, 58, 183, 0.5)),
  statusGroundTransparent(Color.fromRGBO(255, 179, 0, 0.5)),
  statusVenenoTransparent(Color.fromRGBO(156, 39, 176, 0.5)),
  statusFlyingTransparent(Color.fromRGBO(0, 188, 212, 0.5));

  const ElementStatusColors(this.color);
  final Color color;
}

class Colors {
  static const Map<int, Color> salmonBrand = <int, Color>{
    5: Color.fromRGBO(250, 240, 230, 1),
    10: Color.fromRGBO(220, 190, 182, 1),
    20: Color.fromRGBO(244, 181, 164, 1),
    30: Color.fromRGBO(204, 120, 97, 1),
  };

  static const Map<int, Color> escalaDeCinza = <int, Color>{
    800: Color.fromRGBO(51, 51, 51, 1),
    70: Color.fromRGBO(77, 77, 77, 1),
  };
  static const Map<int, Color> sunsetWarning = <int, Color>{
    5: Color.fromRGBO(255, 239, 187, 1),
    10: Color.fromRGBO(255, 220, 103, 1),
    20: Color.fromRGBO(255, 207, 45, 1),
    30: Color.fromRGBO(242, 177, 44, 1),
    40: Color.fromRGBO(243, 150, 46, 1),
    50: Color.fromRGBO(246, 139, 19, 1),
    60: Color.fromRGBO(229, 123, 5, 1),
    70: Color.fromRGBO(205, 108, 0, 1),
  };

  static const Map<int, Color> bitterSweetError = <int, Color>{
    0: Color.fromRGBO(255, 221, 221, 1),
    5: Color.fromRGBO(255, 182, 182, 1),
    10: Color.fromRGBO(255, 108, 108, 1),
    20: Color.fromRGBO(255, 70, 70, 1),
    30: Color.fromRGBO(208, 29, 29, 1),
    40: Color.fromRGBO(172, 13, 13, 1),
    50: Color.fromRGBO(143, 8, 8, 1),
  };

  static const Map<int, Color> neutralGray = <int, Color>{
    0: Color.fromRGBO(231, 231, 231, 1),
    10: Color.fromRGBO(208, 208, 208, 1),
    20: Color.fromRGBO(184, 184, 184, 1),
    30: Color.fromRGBO(160, 160, 160, 1),
    40: Color.fromRGBO(137, 137, 137, 1),
    50: Color.fromRGBO(113, 113, 113, 1),
    60: Color.fromRGBO(89, 89, 89, 1),
    70: Color.fromRGBO(65, 65, 65, 1),
    80: Color.fromRGBO(42, 42, 42, 1),
    90: Color.fromRGBO(18, 18, 18, 1),
  };
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color transparent = Color.fromRGBO(255, 255, 255, 0);
}
