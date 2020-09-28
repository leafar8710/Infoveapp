import 'dart:ui';
import 'package:infoveapp/src/pages/busqueda_documento_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import '../login_state.dart';

class ConsultaDocumentoScreen extends StatefulWidget {
  ConsultaDocumentoScreen({this.consultaDocumento});
  final consultaDocumento;

  @override
  _ConsultaDocumentoScreenState createState() =>
      _ConsultaDocumentoScreenState();
}

class _ConsultaDocumentoScreenState extends State<ConsultaDocumentoScreen> {
  String placa;
  String vigencia;
  String contribuyente;
  String cedula;
  String valor_mp;

  @override
  void initState() {
    super.initState();

    updateUI(widget.consultaDocumento);
  }

  void updateUI(dynamic decodeData) {
    placa = decodeData[0]['placa'];
    vigencia = decodeData[0]['vigencia'];
    contribuyente = decodeData[0]['contribuyente'];
    cedula = decodeData[0]['cedula'];
    valor_mp = decodeData[0]['valor_mp'];

    print(placa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado búsqueda'),),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            child: Column(children: <Widget>[
              SizedBox(height: 50.0),
              Text(
                'Multas por pagar',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color(0xFF27415C)),
              ),
              SizedBox(height: 50.0),
              Container(color: Color(0xFF2172af),
                width: 500,
                child: Row(children: <Widget>[
                  RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      elevation: 0.0,
                      padding:
                      EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
                      color: Color(0xFF2172af),
                      textColor: Colors.white,
                      label: Text('', style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      icon: Icon(Icons.person_pin),
                      onPressed: () {
                      }),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      elevation: 0.0,
                      padding:
                      EdgeInsets.symmetric(horizontal: 1.0, vertical: 10.5),
                      child: Text('Nombre: $contribuyente',textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {}),
                ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(color: Color(0xFF2172af),
                width: 500,
                child: Row(children: <Widget>[
                  RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      elevation: 0.0,
                      padding:
                      EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
                      color: Color(0xFF2172af),
                      textColor: Colors.white,
                      label: Text('', style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      icon: Icon(Icons.perm_identity),
                      onPressed: () {
                      }),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      elevation: 0.0,
                      padding:
                      EdgeInsets.symmetric(horizontal: 1.0, vertical: 10.5),
                      child: Text('Cédula: $cedula',textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {}),
                    ],
                  ),
                  ),
              SizedBox(height: 30.0),
              Container(color: Color(0xFF2172af),
                width: 500,
                child: Row(children: <Widget>[
                  RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      elevation: 0.0,
                      padding:
                      EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
                      color: Color(0xFF2172af),
                      textColor: Colors.white,
                      label: Text('', style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      icon: Icon(Icons.time_to_leave),
                      onPressed: () {
                      }),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      elevation: 0.0,
                      padding:
                      EdgeInsets.symmetric(horizontal: 1.0, vertical: 10.5),
                      child: Text('Placa: $placa',textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {}),
                ],
                ),
              ),
              SizedBox(height: 30.0),
              Container(color: Color(0xFF2172af),
                width: 500,
                child: Row(children: <Widget>[
                  RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      elevation: 0.0,
                      padding:
                      EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
                      color: Color(0xFF2172af),
                      textColor: Colors.white,
                      label: Text('', style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      icon: Icon(Icons.payment),
                      onPressed: () {
                      }),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      elevation: 0.0,
                      padding:
                      EdgeInsets.symmetric(horizontal: 1.0, vertical: 10.5),
                      child: Text('Valor: $valor_mp',textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {}),
                ],
                ),
              ),
              SizedBox(height: 200.0),
              Container(
                width: 180,
                child: RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    elevation: 10.0,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    color: Color(0xFF2172af),
                    textColor: Colors.white,
                    label: Text(
                      'Cerrar sesión',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    icon: Icon(Icons.settings_power),
                    onPressed: () {
                      Provider.of<LoginState>(context).logout();
                      Navigator.of(context).pop();
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
