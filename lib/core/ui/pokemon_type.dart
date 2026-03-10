/// Enum centralizado de tipos de Pokémon.
/// Fuente única de verdad para: key de API.
enum PokemonType {
  normal('normal'),
  fire('fire'),
  water('water'),
  grass('grass'),
  electric('electric'),
  ice('ice'),
  fighting('fighting'),
  poison('poison'),
  ground('ground'),
  flying('flying'),
  psychic('psychic'),
  bug('bug'),
  rock('rock'),
  ghost('ghost'),
  dragon('dragon'),
  dark('dark'),
  steel('steel'),
  fairy('fairy');

  const PokemonType(this.apiKey);

  final String apiKey;

  static PokemonType fromString(String type) => PokemonType.values.firstWhere(
    (PokemonType t) => t.apiKey == type.toLowerCase(),
    orElse: () => PokemonType.normal,
  );
}
