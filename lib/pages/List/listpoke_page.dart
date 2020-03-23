import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'listpoke_controller.dart';


class Listpoke extends StatefulWidget {
  @override
  _ListpokeState createState() => _ListpokeState();
}

class _ListpokeState extends State<Listpoke> {
  final listPokemonController = Modular.get<PokemonController>();
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
        onPressed: () => listPokemonController.getListPokemons(),
        child: Icon(Icons.replay),
      ),
    );
  }
}
