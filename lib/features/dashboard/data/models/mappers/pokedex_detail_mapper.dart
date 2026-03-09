import '../../../domain/entities/pokedex_detail.dart';
import '../pokedex_detail_model.dart';
import '../pokemon_species_model.dart';

extension PokedexDetailMapper on PokedexDetailModel {
  PokedexDetail toEntity(PokemonSpeciesModel species) {
    String description = species.flavorTextEntries
        .firstWhere(
          (FlavorTextEntry e) => e.language.name == 'es',
          orElse: () => species.flavorTextEntries.first,
        )
        .flavorText
        .replaceAll('\n', ' ')
        .replaceAll('\f', ' ');

    String category = species.genera
        .firstWhere(
          (Genus g) => g.language.name == 'es',
          orElse: () => species.genera.first,
        )
        .genus;

    double malePercentage = _calculateMale(species.genderRate);
    double femalePercentage = _calculateFemale(species.genderRate);

    return PokedexDetail(
      id: id,
      name: name,
      imageUrl: sprites.other.officialArtwork.imageUrl,
      types: types.map((TypeSlot e) => e.type.name).toList(),
      description: description,
      weight: weight / 10,
      height: height / 10,
      category: category,
      ability: abilities.first.ability.name,
      malePercentage: malePercentage,
      femalePercentage: femalePercentage,
      weaknesses: _calculateWeaknesses(
        types.map((TypeSlot e) => e.type.name).toList(),
      ),
    );
  }
}

double _calculateMale(int genderRate) {
  if (genderRate == -1) {
    return 0;
  }

  double female = genderRate * 12.5;
  return 100 - female;
}

double _calculateFemale(int genderRate) {
  if (genderRate == -1) {
    return 0;
  }

  return genderRate * 12.5;
}

List<String> _calculateWeaknesses(List<String> types) {
  const Map<String, List<String>> weaknesses = <String, List<String>>{
    'grass': <String>['fire', 'ice', 'poison', 'flying', 'bug'],
    'fire': <String>['water', 'ground', 'rock'],
    'water': <String>['electric', 'grass'],
    'electric': <String>['ground'],
    'rock': <String>['water', 'grass', 'fighting', 'ground', 'steel'],
    'ground': <String>['water', 'grass', 'ice'],
  };

  Set<String> result = <String>{};

  for (String type in types) {
    result.addAll(weaknesses[type] ?? <String>[]);
  }

  return result.toList();
}
