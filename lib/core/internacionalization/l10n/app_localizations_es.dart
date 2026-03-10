// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get begin => 'Comenzar';

  @override
  String get error_title_no_pokemons => 'No hay pokemones :c';

  @override
  String get error_desc_no_pokemons => 'Por favor selecciona otro filtro';

  @override
  String get error_title_coming_soon => '¡Muy pronto disponible!';

  @override
  String get error_description_coming_soon =>
      'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.';

  @override
  String get error_title_no_favourite =>
      'No has marcado ningún Pokémon como favorito';

  @override
  String get error_description_no_favourites =>
      'Haz clic en el ícono de corazón de tus Pokémon favoritos y aparecerán aquí.';

  @override
  String get error_retry => 'Ocurrió un error, inténtalo de nuevo';

  @override
  String get error_retry_button => 'Reintentar';

  @override
  String get error_loading_information =>
      'No pudimos cargar la información en este momento. Verifica tu conexión o intenta nuevamente más tarde.';

  @override
  String get generic_error =>
      'No pudimos completar la petición, intenta nuevamente';

  @override
  String get generic_error_title => 'Algo salió mal...';

  @override
  String get navbar_pokedex => 'Pokédex';

  @override
  String get navbar_regions => 'Regiones';

  @override
  String get navbar_favourites => 'Favoritos';

  @override
  String get navbar_profile => 'Perfil';

  @override
  String number(Object number) {
    return 'Nº$number';
  }

  @override
  String get onboarding_continue => 'Continuar';

  @override
  String get onboarding_title_all_pokemons_in_the_same_place =>
      'Todos los Pokémon en un solo lugar';

  @override
  String get onboarding_description_all_pokemon =>
      'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo';

  @override
  String get onboarding_title_keep_updated => 'Mantén tu Pokédex actualizada';

  @override
  String get onboarding_description_profile =>
      'Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y mucho más en la aplicación';

  @override
  String get pokedex_detail_gender => 'GÉNERO';

  @override
  String get pokedex_detail_weight => 'PESO';

  @override
  String get pokedex_detail_height => 'ALTURA';

  @override
  String get pokedex_detail_category => 'CATEGORÍA';

  @override
  String get pokedex_detail_ability => 'HABILIDAD';

  @override
  String get pokedex_detail_male => 'MASCULINO';

  @override
  String get pokedex_detail_female => 'FEMENINO';

  @override
  String get pokedex_detail_weaknesses => 'Debilidades';

  @override
  String get pokedex_detail_unknown => 'Desconocido';

  @override
  String get filter_title => 'Filtra por tus preferencias';

  @override
  String get filter_type => 'Tipo';

  @override
  String get filter_apply => 'Aplicar';

  @override
  String get filter_cancel => 'Cancelar';

  @override
  String get search_pokemon_hint => 'Procurar Pókemon...';
}
