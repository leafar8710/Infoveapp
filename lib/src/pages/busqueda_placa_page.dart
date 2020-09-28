import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:infoveapp/src/login_state.dart';
import 'dart:io';									
import 'package:dio/dio.dart';
import 'package:infoveapp/src/models/proceso_model.dart';

class PlacaPage extends StatelessWidget {

  Dio dio;
  final formKey = GlobalKey<FormState>();
  final Proceso proceso = new Proceso();

  Widget _placa() {
    return TextFormField(
	
	initialValue: proceso.placa,  
      decoration: InputDecoration(labelText: 'Placa '),
	  onSaved: (value) => proceso.placa = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'rellenar campos';
        }
        return null;
      },																 							
      maxLength: 6,
      textCapitalization: TextCapitalization.characters,
    );
  }

  Widget _vigencia() {
    return TextFormField(
      initialValue: proceso.vigencia.toString(),
      decoration: InputDecoration(labelText: 'vigencia '),
      onSaved: (value) => proceso.vigencia = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'rellenar campos';
        }
        return null;
      },
      textCapitalization: TextCapitalization.characters,
    );
  }

  Widget _boton() {
    return RaisedButton.icon(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        elevation: 10.0,
        padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 12.0),
        color: Color(0xFF2172af),
        textColor: Colors.white,
        label: Text('Buscar', style: TextStyle(fontSize: 18, color: Colors.white),),
        icon: Icon(Icons.search),
        onPressed: _submit
    );
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Consulta por placa'),
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
                  _placa(),
                  SizedBox(height: 30.0),
                  _vigencia(),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
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
          ]
      ),
    );
  }

   void initDio() {
    dio = new Dio();
    dio.interceptors.add(InterceptorsWrapper(onError: (error) {
      print(error.error);
      if (error.error.runtimeType == SocketException) {
        print('Error');
      } else {
        print(error.toString() + " " + error.request.path);
        print('Error');
      }
    }));
	  
  }					 
  Future<dynamic> getServiceTerminacionPlacaFecha(String placa, String fecha) async {
    initDio();
    dynamic result;
    String urlQuery =
        'https://infoappve.azurewebsites.net/Servicios/GetPlaca?placa=${placa}&fecha=${fecha}';
    try {
      await dio.get(urlQuery).then((response) {
        result = response;
        print(response.data);
        if(response.data.empty == null)
        {
          print("No se encuentra informacion relacionada con esta placa o fecha.");
        }else{
          print(response);
        }

      });
    } on DioError catch (e) {
      if (e.response != null) {
        result = e.response;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
        return null;
      }
    }
    print(result.statusCode);
    return result;
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    getServiceTerminacionPlacaFecha(proceso.placa, proceso.vigencia);
    print(proceso.placa);
    print(proceso.vigencia);
  }
}
