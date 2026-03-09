import '../../../domain/entities/pokemon_species.dart';
import '../pokemon_species_model.dart';

extension PokemonSpeciesMapper on PokemonSpeciesModel {
  PokemonSpecies toEntity() {
    FlavorTextEntry spanishFlavor = flavorTextEntries.firstWhere(
      (FlavorTextEntry e) => e.language.name == 'es',
      orElse: () => flavorTextEntries.first,
    );

    Genus spanishGenus = genera.firstWhere(
      (Genus g) => g.language.name == 'es',
      orElse: () => genera.first,
    );

    return PokemonSpecies(
      description: spanishFlavor.flavorText
          .replaceAll('\n', ' ')
          .replaceAll('\f', ' '),
      genus: spanishGenus.genus,
      genderRate: genderRate,
    );
  }
}
