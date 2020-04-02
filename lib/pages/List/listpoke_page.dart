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
          return GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children: List.generate(list.length, (index) {
                return Container(
                  child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 10,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => print('clicou'),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Image.network(list[index].img),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => print('clicou'),
                            child: Text(
                              list[index].name,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900]),
                            ),
                          ),
                        ],
                      )),
                );
              }));
        }));
  }
}
