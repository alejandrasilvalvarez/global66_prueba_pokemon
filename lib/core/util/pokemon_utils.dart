int extractPokemonId(String url) {
  Uri uri = Uri.parse(url);
  List<String> segments = uri.pathSegments;
  return int.parse(segments[segments.length - 2]);
}
