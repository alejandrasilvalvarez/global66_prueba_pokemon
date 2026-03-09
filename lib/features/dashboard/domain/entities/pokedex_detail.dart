class PokedexDetail {
  PokedexDetail({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.description,
    required this.weight,
    required this.height,
    required this.category,
    required this.ability,
    required this.malePercentage,
    required this.femalePercentage,
    required this.weaknesses,
  });
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final String description;

  final double weight;
  final double height;

  final String category;
  final String ability;

  final double malePercentage;
  final double femalePercentage;

  final List<String> weaknesses;
}
