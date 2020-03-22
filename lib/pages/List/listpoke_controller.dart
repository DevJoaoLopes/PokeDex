import 'package:mobx/mobx.dart';
import 'package:pokeapp/shared/models/list_pokemon_model.dart';
import 'package:pokeapp/shared/repositories/list_pokemon_repository.dart';
part 'listpoke_controller.g.dart';

class ListPokemonController = _ListPokemonControllerBase with _$ListPokemonController;

abstract class _ListPokemonControllerBase with Store {

  final ListPokemonRepository repository;

  @observable
  ObservableFuture<List<ListPokemonModel>> pokemons;

  _ListPokemonControllerBase(this.repository) {
    pokemons = repository.getPokemons().asObservable();
  }

  @action
  getListPokemons(){
    pokemons = repository.getPokemons().asObservable();
  }
}
