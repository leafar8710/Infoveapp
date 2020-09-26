import 'dart:convert';
//import 'dart:io';
//import 'package:dio/dio.dart';
//import 'package:formvalidation/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
//import 'package:http_parser/http_parser.dart';

//import 'package:mime_type/mime_type.dart';

import 'package:infoveapp/src/models/proceso_model.dart';
//import 'package:infoveapp1/src/pages/documento_page2.dart';

class ProcesoProvider {
  //link url base general
  final String _url = 'https://infoveapp.firebaseio.com';
  //final _prefs = new PreferenciasUsuario();

  Future<bool> crearProceso(Proceso proceso) async {
    //final url = '$_url/proceso.json?auth=${_prefs.token}';
    final url = '$_url/proceso.json';
    final resp = await http.post(url, body: procesoToJson(proceso));

    final decodedData = json.decode(resp.body);

    print('decodedata ' + decodedData);

    return true;
  }

  Future<bool> editarProceso(Proceso proceso) async {
    // final url = '$_url/proceso/${proceso.id}.json?auth=${_prefs.token}';
    final url = '$_url/proceso.json';

    final resp = await http.put(url, body: procesoToJson(proceso));

    final decodedData = json.decode(resp.body);

    print('decodedata ' + decodedData);

    return true;
  }

  Future<List<Proceso>> cargarProcesos() async {
    //final url = '$_url/proceso.json?auth=${_prefs.token}';
    final url = '$_url/proceso.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<Proceso> proceso = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, proc) {
      final procTemp = Proceso.fromJson(proc);
      procTemp.id = id;

      proceso.add(procTemp);
    });

    print(proceso[1].id);

    return proceso;
  }

}
