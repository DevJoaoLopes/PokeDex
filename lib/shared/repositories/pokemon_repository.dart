import 'package:dio/dio.dart';
import 'package:pokeapp/shared/models/pokemon_model.dart';
import 'package:pokeapp/shared/utils/constantes.dart';

class PokemonRepository {
  final Dio dio;

  PokemonRepository(this.dio);

  Future<List<PokemonModel>> getPokemons() async {
    var response1 = await dio.get(
      urlPokemons,
    );
    List<PokemonModel> list = [];
    for (var json in (response1.data['results'] as List)) {
      var response2 = await dio.get(json['url']);
      for (var json2 in (response2.data['forms'] as List)) {
        print(json['name']); // !Tirar print
        print(response2.data['sprites']['front_shiny']); // !Tirar print
        PokemonModel model = PokemonModel(
          name: json2['name'],
          img: response2.data['sprites']['front_shiny'],
        );
        list.add(model);
      }
    }
    return list;
  }
}


