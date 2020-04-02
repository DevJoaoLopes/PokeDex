import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeapp/shared/utils/widgets/oval_right_clipper.dart';
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
        ),
        drawer: _buildDrawer(),
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
                              onTap: () =>
                                  print('clicou'), // ! Rota para detalhes
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
                            onTap: () =>
                                print('clicou'), // ! Rota para detalhes
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

  _buildDrawer() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: Colors.grey.shade800,
                      ),
                      onPressed: () =>  {}, // ! Colocar rota para fechar o app
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.white])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('lib/shared/assets/profile.png'),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "Joao Lopes",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "@DevJoaoLopes",
                    style:
                        TextStyle(color: Colors.grey.shade800, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.home, "Home", '/'),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "My profile", ''),
                  _buildDivider(),
                  _buildRow(Icons.email, "Contact us", ''),
                  _buildDivider(),
                  _buildRow(Icons.message, "Messages", '', showBadge: true),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.grey.shade600,
    );
  }

  Widget _buildRow(IconData icon, String title, String route, {bool showBadge = false}) {
    final TextStyle tStyle =
        TextStyle(color: Colors.grey.shade800, fontSize: 16.0);
    return GestureDetector(
      onTap: () => route != '' ? Modular.to.pushNamed(route) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(children: [
          Icon(
            icon,
            color: Colors.grey.shade800,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
          Spacer(),
          showBadge
              ? (Material(
                  color: Colors.deepOrange,
                  elevation: 5.0,
                  shadowColor: Colors.red,
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "10+",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
              : SizedBox.shrink() // * Box vazio
        ]),
      ),
    );
  }
}
