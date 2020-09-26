import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:infoveapp/src/login_state.dart';


class SugerenciasPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Sugerencias y/o peticiones'),
          leading: IconButton(
            tooltip: 'Atrás',
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, 'menu'),
          ),),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(15.0),
              child: Form(
                  key: formKey,
                  child: Column(children: <Widget>[
                    SizedBox(height: 30.0),
                    _asunto(),
                    SizedBox(height: 30.0),
                    _descripcion(),
                    SizedBox(height: 30.0),
                    _boton(),
                    SizedBox(height: 300.0),
                    Container(
                      width: 180,
                      child: RaisedButton.icon(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          elevation: 10.0,
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          color: Color(0xFF2172af),
                          textColor: Colors.white,
                          label: Text('Cerrar sesión', style: TextStyle(fontSize: 14, color: Colors.white),),
                          icon: Icon(Icons.settings_power),
                          onPressed: () {Provider.of<LoginState>(context).logout();
                          Navigator.of(context).pop();}),
                    ),
                  ]))),
        ));

  }

  Widget _asunto() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Asunto '),
      validator: (value) {
        if (value.isEmpty) {
          return 'rellenar campos';
        }
        return null;
      },
    );
  }

  Widget _descripcion() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Descripcion '),
      validator: (value) {
        if (value.isEmpty) {
          return 'rellenar campos';
        }
        return null;
      },
    );
  }

  Widget _boton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      elevation: 10.0,
      padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 12.0),
      color: Color(0xFF2172af),
      textColor: Colors.white,
      label: Text('Enviar', style: TextStyle(fontSize: 18, color: Colors.white),),
      icon: Icon(Icons.search),
      onPressed: _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;
  }
}

// prueba de git