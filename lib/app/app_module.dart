import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeapp/app/app_controller.dart';
import 'package:pokeapp/app/app_widget.dart';
import 'package:pokeapp/pages/Contact/contact_page.dart';
import 'package:pokeapp/pages/Details/details_page.dart';
import 'package:pokeapp/pages/List/listpoke_controller.dart';
import 'package:pokeapp/pages/List/listpoke_page.dart';
import 'package:pokeapp/pages/Profile/profile_page.dart';
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
        // !Criar rota home aqui
        Router('/home', child: (_, args) => Listpoke()),
        Router('/list', child: (_, args) => Listpoke()),
        Router('/details', child: (_, args) => Details()),
        Router('/profile', child: (_, args) => Profile()),
        Router('/contact', child: (_, args) => Contact()),
      ]; //pages routes

  @override
  Widget get bootstrap => AppWidget(); //page start
}
