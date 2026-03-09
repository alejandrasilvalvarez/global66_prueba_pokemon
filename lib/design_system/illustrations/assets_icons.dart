class AssetsConstants {
  // Paths base
  static const String _elementsPath = 'assets/illustrations_elements';
  static const String _splashPath = 'assets/illustration_splash';
  static const String _errorsPath = 'assets/illustrations_errors';

  // --- Illustrations Elements ---
  static const String bug = '$_elementsPath/bug.svg';
  static const String dark = '$_elementsPath/dark.svg';
  static const String dragon = '$_elementsPath/dragon.svg';
  static const String electric = '$_elementsPath/electric.svg';
  static const String fairy = '$_elementsPath/fairy.svg';
  static const String fighting = '$_elementsPath/fighting.svg';
  static const String fire = '$_elementsPath/fire.svg';
  static const String flying = '$_elementsPath/flying.svg';
  static const String ghost = '$_elementsPath/ghost.svg';
  static const String grass = '$_elementsPath/grass.svg';
  static const String ground = '$_elementsPath/ground.svg';
  static const String normal = '$_elementsPath/normal.svg';
  static const String poison = '$_elementsPath/poison.svg';
  static const String psychic = '$_elementsPath/psychic.svg';
  static const String rock = '$_elementsPath/rock.svg';
  static const String steel = '$_elementsPath/steel.svg';
  static const String water = '$_elementsPath/water.svg';

  // --- Illustration Splash ---
  static const String illustrationHilda = '$_splashPath/illustration_hilda.png';
  static const String illustrationTrainer =
      '$_splashPath/illustration_trainer.png';
  static const String loaderSplash = '$_splashPath/loader_splash.svg';

  // --- Illustration errors ---
  static const String illustrationMagikarpError = '$_errorsPath/magikarp_error.png';
  static const String illustrationJigglypuffError = '$_errorsPath/jigglypuff_error.png';



  /// Devuelve la ruta del asset SVG basado en el tipo de Pokémon.
  static String getIconByType(String type) {
    switch (type.toLowerCase()) {
      case 'bug':
        return bug;
      case 'dark':
        return dark;
      case 'dragon':
        return dragon;
      case 'electric':
        return electric;
      case 'fairy':
        return fairy;
      case 'fighting':
        return fighting;
      case 'fire':
        return fire;
      case 'flying':
        return flying;
      case 'ghost':
        return ghost;
      case 'grass':
        return grass;
      case 'ground':
        return ground;
      case 'normal':
        return normal;
      case 'poison':
        return poison;
      case 'psychic':
        return psychic;
      case 'rock':
        return rock;
      case 'steel':
        return steel;
      case 'water':
        return water;
      default:
        return normal;
    }
  }
}
