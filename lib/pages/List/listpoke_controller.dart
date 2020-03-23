import 'package:mobx/mobx.dart';
import 'package:pokeapp/shared/models/pokemon_model.dart';
import 'package:pokeapp/shared/repositories/pokemon_repository.dart';
part 'listpoke_controller.g.dart';

class PokemonController = _ListPokemonControllerBase with _$PokemonController;

abstract class _ListPokemonControllerBase with Store {

  final PokemonRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _ListPokemonControllerBase(this.repository){
    pokemons = repository.getPokemons().asObservable();
  }

  @action
  getListPokemons(){
    pokemons = repository.getPokemons().asObservable();
  }
}
