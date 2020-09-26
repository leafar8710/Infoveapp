// To parse this JSON data, do
//
//     final proceso = procesoFromJson(jsonString);

import 'dart:convert';

Proceso procesoFromJson(String str) => Proceso.fromJson(json.decode(str));

String procesoToJson(Proceso data) => json.encode(data.toJson());

class Proceso {
  Proceso({
    this.id,
    this.busqueda,
    this.placa,
    this.vigencia = '2012',
    this.expediente,
    this.nombre,
    this.documento,
    this.valorMp,
    this.fechaMp,
    this.resolucionMp,
    this.fechaLoa,
    this.loa,
    this.embargo,
    this.fechaEmbargo,
    this.numeroEmbargo,
    this.valorEmbargo,
    this.transito,
  });

  String id;
  String busqueda;
  String placa;
  String vigencia;
  int expediente;
  String nombre;
  int documento;
  int valorMp;
  String fechaMp;
  int resolucionMp;
  String fechaLoa;
  int loa;
  String embargo;
  String fechaEmbargo;
  String numeroEmbargo;
  String valorEmbargo;
  String transito;

  factory Proceso.fromJson(Map<String, dynamic> json) => Proceso(
    id: json["id"],
    busqueda: json["busqueda"],
    placa: json["placa"],
    vigencia: json["vigencia"],
    expediente: json["expediente"],
    nombre: json["nombre"],
    documento: json["documento"],
    valorMp: json["valorMp"],
    fechaMp: json["fechaMp"],
    resolucionMp: json["resolucionMp"],
    fechaLoa: json["fechaLoa"],
    loa: json["loa"],
    embargo: json["embargo"],
    fechaEmbargo: json["fechaEmbargo"],
    numeroEmbargo: json["numeroEmbargo"],
    valorEmbargo: json["valorEmbargo"],
    transito: json["transito"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "busqueda": busqueda,
    "placa": placa,
    "vigencia": vigencia,
    "expediente": expediente,
    "nombre": nombre,
    "documento": documento,
    "valorMp": valorMp,
    "fechaMp": fechaMp,
    "resolucionMp": resolucionMp,
    "fechaLoa": fechaLoa,
    "loa": loa,
    "embargo": embargo,
    "fechaEmbargo": fechaEmbargo,
    "numeroEmbargo": numeroEmbargo,
    "valorEmbargo": valorEmbargo,
    "transito": transito,
  };
}
