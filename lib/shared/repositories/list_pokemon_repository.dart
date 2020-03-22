import 'package:dio/dio.dart';
import 'package:pokeapp/shared/models/list_pokemon_model.dart';
import 'package:pokeapp/shared/utils/constantes.dart';

class ListPokemonRepository {
  final Dio dio;

  ListPokemonRepository(this.dio);

  Future<List<ListPokemonModel>> getPokemons() async {
    var response = await dio.get(
      urlPokemons,
    );
    List<ListPokemonModel> list = [];
    for (var json in (response.data['results'] as List)) {
      ListPokemonModel model = ListPokemonModel(
        name: json['name'],
        url: json['url'],
        count: response.data['count'],
      );
      list.add(model);
    }
    return list;
  }
}
