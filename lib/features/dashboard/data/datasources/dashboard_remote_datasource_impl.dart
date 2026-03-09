import 'package:dio/dio.dart';

import '../models/pokemon_small_detail_model.dart';
import '../models/pokemon_list_response.dart';
import 'dashboard_remote_datasource.dart';

class DashboardRemoteDatasourceImpl implements DashboardRemoteDatasource {
  DashboardRemoteDatasourceImpl(this.dio);
  final Dio dio;

  @override
  Future<PokemonListResponse> fetchPokemons() async {
    Response<dynamic> response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon',
    );

    return PokemonListResponse.fromJson(response.data);
  }

  @override
  Future<PokemonSmallDetailModel> fetchPokemonDetail(int id) async {
    Response<dynamic> response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon/$id',
    );

    return PokemonSmallDetailModel.fromJson(response.data);
  }
}
