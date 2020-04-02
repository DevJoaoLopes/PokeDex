import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeapp/app/app_controller.dart';
import 'package:pokeapp/app/app_widget.dart';
import 'package:pokeapp/pages/List/listpoke_controller.dart';
import 'package:pokeapp/pages/List/listpoke_page.dart';
import 'package:pokeapp/shared/repositories/pokemon_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => PokemonController(i.get<PokemonRepository>()), singleton: false),
        Bind((i) => PokemonRepository(i.get<Dio>())),
        Bind((i) => Dio()),
      ]; //array de injecao de dependencia

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => Listpoke()),
      ]; //pages routes

  @override
  Widget get bootstrap => AppWidget(); //page start
}
