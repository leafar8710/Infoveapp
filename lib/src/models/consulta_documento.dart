import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

//Future<ConsultaDocumento> futureConsultaDocumento;

Future<ConsultaDocumento> fetchConsultaDocumento() async{
  final response = await http.get('https://infoappve.azurewebsites.net/Servicios/GetDocumento?id=79488667');
  if (response.statusCode == 200) {
    return ConsultaDocumento.fromJson(json.decode(response.body));
  } else {
    throw Exception(response.statusCode);
  }
}

class ConsultaDocumento {
  final String id_proceso;
  final String placa;
  final String vigencia;
  final String contribuyente;
  final String cedula;
  final String loa;
  final String fecha_loa;
  final String mp;
  final String valor_mp;
  final String expediente;
  final String transito;
  final String embargo;
  final String fecha_embargo;
  final String fecha_auto_mp;


  ConsultaDocumento({this.id_proceso, this.placa, this.vigencia, this.contribuyente, this.cedula, this.loa, this.fecha_loa, this.mp, this.valor_mp, this.expediente, this.transito, this.embargo, this.fecha_embargo, this.fecha_auto_mp});

  factory ConsultaDocumento.fromJson(Map<String, dynamic> json) {
    return ConsultaDocumento(
      id_proceso: json['id_proceso'],
      placa: json['placa'],
      vigencia: json['vigencia'],
      contribuyente: json['contribuyente'],
      cedula: json['cedula'],
      loa: json['loa'],
      fecha_loa: json['fecha_loa'],
      mp: json['mp'],
      valor_mp: json['valor_mp'],
      expediente: json['expediente'],
      transito: json['transito'],
      embargo: json['embargo'],
      fecha_embargo: json['fecha_embargo'],
      fecha_auto_mp: json['fecha_auto_mp'],
    );
  }
}

