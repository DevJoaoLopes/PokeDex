import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('lib/shared/assets/logo.png'),
              ),
              Text(
                'Pokemons',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Pokemons app flutter",
                style: TextStyle(fontSize: 20, color: Colors.green[900]),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.transparent,
                height: 130,
              ),
              ButtonTheme(
                  height: 70,
                  child: RaisedButton(
                    onPressed: () => Modular.to.pushNamed("/list"),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Go",
                            style: TextStyle(color: Colors.white, fontSize: 26),
                          ),
                          IconButton(
                            onPressed: () => Modular.to.pushNamed("/list"),
                            icon: Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                          )
                        ]),
                    color: Colors.green[800],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
