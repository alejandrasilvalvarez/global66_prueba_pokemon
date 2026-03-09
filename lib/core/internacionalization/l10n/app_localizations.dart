import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @begin.
  ///
  /// In es, this message translates to:
  /// **'Comenzar'**
  String get begin;

  /// No description provided for @error_title_coming_soon.
  ///
  /// In es, this message translates to:
  /// **'¡Muy pronto disponible!'**
  String get error_title_coming_soon;

  /// No description provided for @error_description_coming_soon.
  ///
  /// In es, this message translates to:
  /// **'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.'**
  String get error_description_coming_soon;

  /// No description provided for @error_title_no_favourite.
  ///
  /// In es, this message translates to:
  /// **'No has marcado ningún Pokémon como favorito'**
  String get error_title_no_favourite;

  /// No description provided for @error_description_no_favourites.
  ///
  /// In es, this message translates to:
  /// **'Haz clic en el ícono de corazón de tus Pokémon favoritos y aparecerán aquí.'**
  String get error_description_no_favourites;

  /// No description provided for @error_retry.
  ///
  /// In es, this message translates to:
  /// **'Ocurrió un error, inténtalo de nuevo'**
  String get error_retry;

  /// No description provided for @error_retry_button.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get error_retry_button;

  /// No description provided for @error_loading_information.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar la información en este momento. Verifica tu conexión o intenta nuevamente más tarde.'**
  String get error_loading_information;

  /// No description provided for @generic_error.
  ///
  /// In es, this message translates to:
  /// **'No pudimos completar la petición, intenta nuevamente'**
  String get generic_error;

  /// No description provided for @generic_error_title.
  ///
  /// In es, this message translates to:
  /// **'Algo salió mal...'**
  String get generic_error_title;

  /// No description provided for @navbar_pokedex.
  ///
  /// In es, this message translates to:
  /// **'Pokédex'**
  String get navbar_pokedex;

  /// No description provided for @navbar_regions.
  ///
  /// In es, this message translates to:
  /// **'Regiones'**
  String get navbar_regions;

  /// No description provided for @navbar_favourites.
  ///
  /// In es, this message translates to:
  /// **'Favoritos'**
  String get navbar_favourites;

  /// No description provided for @navbar_profile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get navbar_profile;

  /// No description provided for @number.
  ///
  /// In es, this message translates to:
  /// **'Nº{number}'**
  String number(Object number);

  /// No description provided for @onboarding_continue.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get onboarding_continue;

  /// No description provided for @onboarding_title_all_pokemons_in_the_same_place.
  ///
  /// In es, this message translates to:
  /// **'Todos los Pokémon en un solo lugar'**
  String get onboarding_title_all_pokemons_in_the_same_place;

  /// No description provided for @onboarding_description_all_pokemon.
  ///
  /// In es, this message translates to:
  /// **'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo'**
  String get onboarding_description_all_pokemon;

  /// No description provided for @onboarding_title_keep_updated.
  ///
  /// In es, this message translates to:
  /// **'Mantén tu Pokédex actualizada'**
  String get onboarding_title_keep_updated;

  /// No description provided for @onboarding_description_profile.
  ///
  /// In es, this message translates to:
  /// **'Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y mucho más en la aplicación'**
  String get onboarding_description_profile;

  /// No description provided for @pokedex_detail_gender.
  ///
  /// In es, this message translates to:
  /// **'GÉNERO'**
  String get pokedex_detail_gender;

  /// No description provided for @pokedex_detail_weight.
  ///
  /// In es, this message translates to:
  /// **'PESO'**
  String get pokedex_detail_weight;

  /// No description provided for @pokedex_detail_height.
  ///
  /// In es, this message translates to:
  /// **'ALTURA'**
  String get pokedex_detail_height;

  /// No description provided for @pokedex_detail_category.
  ///
  /// In es, this message translates to:
  /// **'CATEGORÍA'**
  String get pokedex_detail_category;

  /// No description provided for @pokedex_detail_ability.
  ///
  /// In es, this message translates to:
  /// **'HABILIDAD'**
  String get pokedex_detail_ability;

  /// No description provided for @pokedex_detail_male.
  ///
  /// In es, this message translates to:
  /// **'MASCULINO'**
  String get pokedex_detail_male;

  /// No description provided for @pokedex_detail_female.
  ///
  /// In es, this message translates to:
  /// **'FEMENINO'**
  String get pokedex_detail_female;

  /// No description provided for @pokedex_detail_weaknesses.
  ///
  /// In es, this message translates to:
  /// **'Debilidades'**
  String get pokedex_detail_weaknesses;

  /// No description provided for @pokedex_detail_unknown.
  ///
  /// In es, this message translates to:
  /// **'Desconocido'**
  String get pokedex_detail_unknown;

  /// No description provided for @search_pokemon_hint.
  ///
  /// In es, this message translates to:
  /// **'Procurar Pókemon...'**
  String get search_pokemon_hint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
