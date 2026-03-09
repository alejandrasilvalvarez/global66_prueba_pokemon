// ignore_for_file: always_specify_types

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FavouritesLocalDatasource {
  FavouritesLocalDatasource(this.storage);

  final FlutterSecureStorage storage;

  static const String key = 'favorite_pokemons';

  Future<Set<int>> getFavorites() async {
    String? data = await storage.read(key: key);

    if (data == null) {
      return <int>{};
    }

    List list = jsonDecode(data);

    return list.map((e) => e as int).toSet();
  }

  Future<void> saveFavorites(Set<int> favorites) async {
    await storage.write(key: key, value: jsonEncode(favorites.toList()));
  }
}
