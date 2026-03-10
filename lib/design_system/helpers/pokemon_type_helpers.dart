import '../../core/ui/pokemon_type.dart';
import '../configs/pokemon_type_config.dart';
import '../illustrations/assets_icons.dart';
import '../ui_constants/colors.dart';

class PokemonTypeHelper {
  static PokemonTypeConfig getConfig(PokemonType type) {
    switch (type) {
      case PokemonType.fire:
        return PokemonTypeConfig(
          label: 'Fuego',
          color: ElementStatusColors.statusFirePrimary.color,
          icon: AssetsConstants.fire,
        );

      case PokemonType.water:
        return PokemonTypeConfig(
          label: 'Agua',
          color: ElementStatusColors.statusWaterPrimary.color,
          icon: AssetsConstants.water,
        );

      case PokemonType.normal:
        return PokemonTypeConfig(
          label: 'Normal',
          color: ElementStatusColors.statusNormal.color,
          icon: AssetsConstants.normal,
        );
      case PokemonType.grass:
        return PokemonTypeConfig(
          label: 'Planta',
          color: ElementStatusColors.statusGrassPrimary.color,
          icon: AssetsConstants.grass,
        );
      case PokemonType.electric:
        return PokemonTypeConfig(
          label: 'Eléctrico',
          color: ElementStatusColors.statusElectricPrimary.color,
          icon: AssetsConstants.electric,
        );
      case PokemonType.ice:
        return PokemonTypeConfig(
          label: 'Hielo',
          color: ElementStatusColors.statusIcePrimary.color,
          icon: AssetsConstants.ice,
        );
      case PokemonType.fighting:
        return PokemonTypeConfig(
          label: 'Lucha',
          color: ElementStatusColors.statusFightingPrimary.color,
          icon: AssetsConstants.fighting,
        );
      case PokemonType.poison:
        return PokemonTypeConfig(
          label: 'Veneno',
          color: ElementStatusColors.statusVenenoPrimary.color,
          icon: AssetsConstants.poison,
        );
      case PokemonType.ground:
        return PokemonTypeConfig(
          label: 'Tierra',
          color: ElementStatusColors.statusGroundPrimary.color,
          icon: AssetsConstants.ground,
        );
      case PokemonType.flying:
        return PokemonTypeConfig(
          label: 'Volador',
          color: ElementStatusColors.statusFlyingPrimary.color,
          icon: AssetsConstants.flying,
        );
      case PokemonType.psychic:
        return PokemonTypeConfig(
          label: 'Psíquico',
          color: ElementStatusColors.statusPsychicPrimary.color,
          icon: AssetsConstants.psychic,
        );
      case PokemonType.bug:
        return PokemonTypeConfig(
          label: 'Bicho',
          color: ElementStatusColors.statusBugPrimary.color,
          icon: AssetsConstants.bug,
        );
      case PokemonType.rock:
        return PokemonTypeConfig(
          label: 'Roca',
          color: ElementStatusColors.statusRockPrimary.color,
          icon: AssetsConstants.rock,
        );
      case PokemonType.ghost:
        return PokemonTypeConfig(
          label: 'Fantasma',
          color: ElementStatusColors.statusGhostPrimary.color,
          icon: AssetsConstants.ghost,
        );
      case PokemonType.dragon:
        return PokemonTypeConfig(
          label: 'Dragón',
          color: ElementStatusColors.statusDragonPrimary.color,
          icon: AssetsConstants.dragon,
        );
      case PokemonType.dark:
        return PokemonTypeConfig(
          label: 'Siniestro',
          color: ElementStatusColors.statusDark.color,
          icon: AssetsConstants.dark,
        );
      case PokemonType.steel:
        return PokemonTypeConfig(
          label: 'Acero',
          color: ElementStatusColors.statusSteel.color,
          icon: AssetsConstants.steel,
        );
      case PokemonType.fairy:
        return PokemonTypeConfig(
          label: 'Hada',
          color: ElementStatusColors.statusHadaPrimary.color,
          icon: AssetsConstants.fairy,
        );
    }
  }
}
