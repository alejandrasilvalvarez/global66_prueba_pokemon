import 'dart:ui';

import '../../design_system/illustrations/assets_icons.dart';
import '../../design_system/ui_constants/colors.dart';

class PokemonTypeConfig {
  PokemonTypeConfig({
    required this.primaryColor,
    required this.transparentColor,
    required this.iconPath,
  });

  final Color primaryColor;
  final Color transparentColor;
  final String iconPath;
}

class PokemonTypeHelper {
  static PokemonTypeConfig getConfig(String type) {
    // Normalizamos el string (minúsculas y sin espacios)
    switch (type.toLowerCase().trim()) {
      case 'pasto':
      case 'planta':
      case 'grass':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusGrassPrimary.color,
          transparentColor: ElementStatusColors.statusGrassTransparent.color,
          iconPath: AssetsConstants.grass,
        );
      case 'fuego':
      case 'fire':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusFirePrimary.color,
          transparentColor: ElementStatusColors.statusFireTransparent.color,
          iconPath: AssetsConstants.fire,
        );
      case 'agua':
      case 'water':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusWaterPrimary.color,
          transparentColor: ElementStatusColors.statusWaterTransparent.color,
          iconPath: AssetsConstants.water,
        );
      case 'veneno':
      case 'poison':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusVenenoPrimary.color,
          transparentColor: ElementStatusColors.statusVenenoTransparent.color,
          iconPath: AssetsConstants.poison,
        );
      case 'eléctrico':
      case 'electrico':
      case 'electric':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusElectricPrimary.color,
          transparentColor: ElementStatusColors.statusElectricTransparent.color,
          iconPath: AssetsConstants.electric,
        );
      case 'hielo':
      case 'ice':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusIcePrimary.color,
          transparentColor: ElementStatusColors.statusIceTransparent.color,
          iconPath: AssetsConstants.ice,
        );
      case 'lucha':
      case 'fighting':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusFightingPrimary.color,
          transparentColor: ElementStatusColors.statusFightingTransparent.color,
          iconPath: AssetsConstants.fighting,
        );
      case 'volador':
      case 'flying':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusFlyingPrimary.color,
          transparentColor: ElementStatusColors.statusFlyingTransparent.color,
          iconPath: AssetsConstants.flying,
        );
      case 'psíquico':
      case 'psiquico':
      case 'psychic':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusPsychicPrimary.color,
          transparentColor: ElementStatusColors.statusPsychicTransparent.color,
          iconPath: AssetsConstants.psychic,
        );
      case 'bicho':
      case 'bug':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusBugPrimary.color,
          transparentColor: ElementStatusColors.statusBugTransparent.color,
          iconPath: AssetsConstants.bug,
        );
      case 'roca':
      case 'rock':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusRockPrimary.color,
          transparentColor: ElementStatusColors.statusRockTransparent.color,
          iconPath: AssetsConstants.rock,
        );
      case 'fantasma':
      case 'ghost':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusGhostPrimary.color,
          transparentColor: ElementStatusColors.statusGhostTransparent.color,
          iconPath: AssetsConstants.ghost,
        );
      case 'dragón':
      case 'dragon':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusDragonPrimary.color,
          transparentColor: ElementStatusColors.statusDragonTransparent.color,
          iconPath: AssetsConstants.dragon,
        );
      case 'siniestro':
      case 'dark':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusDark.color,
          transparentColor: ElementStatusColors.statusDarkTransparent.color,
          iconPath: AssetsConstants.dark,
        );
      case 'acero':
      case 'steel':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusSteel.color,
          transparentColor: ElementStatusColors.statusSteelTransparent.color,
          iconPath: AssetsConstants.steel,
        );
      case 'hada':
      case 'fairy':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusHadaPrimary.color,
          transparentColor: ElementStatusColors.statusHadaTransparent.color,
          iconPath: AssetsConstants.fairy,
        );
      case 'tierra':
      case 'ground':
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusGroundPrimary.color,
          transparentColor: ElementStatusColors.statusGroundTransparent.color,
          iconPath: AssetsConstants.ground,
        );
      case 'normal':
      default:
        return PokemonTypeConfig(
          primaryColor: ElementStatusColors.statusNormal.color,
          transparentColor: ElementStatusColors.statusNormalTransparent.color,
          iconPath: AssetsConstants.normal,
        );
    }
  }
}
