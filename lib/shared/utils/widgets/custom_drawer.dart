import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'oval_right_clipper.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      onPressed: () => Modular.to.pushNamed("/home"),
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
                  _buildRow(Icons.home, "Home", '/home'),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "My profile", '/profile'),
                  _buildDivider(),
                  _buildRow(Icons.email, "Contact us", '/contact'),
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

  Widget _buildRow(IconData icon, String title, String route,
      {bool showBadge = false}) {
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
