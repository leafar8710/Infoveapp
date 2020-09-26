import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:infoveapp/src/login_state.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BIENVENIDO',
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
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Container(
                      width: 250,
                      height: 250,
                      child: FlareActor(
                        "assets/Infoveapp.flr",
                        animation: "Info",
                      ),
                    ),
                  ),
                  Consumer<LoginState>(
                    builder:
                        (BuildContext context, LoginState value, Widget child) {
                      if (value.isLoading()) {
                        return CircularProgressIndicator();
                      } else {
                        return child;
                      }
                    },
                    child: Container(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            elevation: 10.0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 12.0),
                            color: Color(0xFF2172af),
                            textColor: Colors.white,
                            label: Text(
                              'Ingresar',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            icon: Icon(Icons.vpn_key),
                            onPressed: () =>
                                Provider.of<LoginState>(context).login(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
