import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'listpoke_controller.dart';

class Listpoke extends StatefulWidget {
  @override
  _ListpokeState createState() => _ListpokeState();
}

class _ListpokeState extends State<Listpoke> {
  final pokemonController = Modular.get<PokemonController>();
  @override
  Widget build(BuildContext _) {
    // *context not used

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green[900],
      statusBarBrightness: Brightness.light,
    ));

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Lista de Pokemons",
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
          backgroundColor: Colors.green[900],
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () => {}, // !colocar rota para fechar o app
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => pokemonController.getListPokemons(),
          child: Icon(Icons.replay),
        ),
        body: Observer(builder: (_) {
          if (pokemonController.pokemons.error != null) {
            return Center(
              child: Text(
                "Erro na listagem dos pokemons!",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900]),
              ),
            );
          }
          if (pokemonController.pokemons.value == null) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ));
          }

          var list = pokemonController.pokemons.value;
          // return Text("Tem dadoss");
          return GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children: List.generate(list.length, (index) {
                return Center(
                    child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Image.network(list[index].img),
                      Text(
                        list[index].name,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900]),
                      ),
                    ],
                  ),
                ));
              }));
        }));
  }
}
