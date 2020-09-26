import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:Text('INFOVEAPP',
            style: TextStyle(fontFamily: 'RussoOne', fontSize: 24.0),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Indique el tipo de consulta que desea realizar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color(0xFF27415C)),
                  ),
                  SizedBox(height: 50.0),
                  CreateButton('Consulta por número de documento'),
                  CreateButton('Consulta por placa y fecha'),
                  CreateButton('Sugerencias y/o peticiones'),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          fixedColor: Color(0xFF2172af),
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedFontSize: 16,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Principal'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Buscar'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              title: Text('Cámara'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Mi Perfil'),
            ),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class CreateButton extends StatelessWidget {
  final String name;
  CreateButton(this.name);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            elevation: 10.0,
            onPressed: () => Navigator.pushReplacementNamed(context, name),
            child: Text(name,
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center),
          ),
          SizedBox(height: 50.0)
        ],
      ),
    );
  }
}
