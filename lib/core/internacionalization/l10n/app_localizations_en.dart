// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get begin => 'Begin';

  @override
  String get error_retry => 'An error occurred, please try again';

  @override
  String get error_retry_button => 'Retry';

  @override
  String get error_loading_information =>
      'We were unable to load the information at this time. Please check your connection or try again later.';

  @override
  String get generic_error =>
      'We could not complete the request, please try again';

  @override
  String get generic_error_title => 'Something went wrong...';

  @override
  String get navbar_pokedex => 'Pokedex';

  @override
  String get navbar_regions => 'Regions';

  @override
  String get navbar_favourites => 'Favourites';

  @override
  String get navbar_profile => 'Profile';

  @override
  String get onboarding_continue => 'Continue';

  @override
  String get onboarding_title_all_pokemons_in_the_same_place =>
      'All Pokemons in the same place';

  @override
  String get onboarding_description_all_pokemon =>
      'Access a wide list of Pokémon from all generations created by Nintendo';

  @override
  String get onboarding_title_keep_updated => 'Mantén tu Pokédex actualizada';

  @override
  String get onboarding_description_profile =>
      'Register and save your profile, favorite Pokémon, settings, and much more in the app.';
}
