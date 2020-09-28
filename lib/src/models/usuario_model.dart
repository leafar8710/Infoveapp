// To parse this JSON data, do
//
//     final proceso = procesoFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.idUsuario,
    this.nombreCompleto,
    this.cedula,
    this.tipoContrato,
    this.tiempoContrato,
    this.correo,
    this.password,
    this.idRol,
    this.cargo,
  });

  String idUsuario;
  String nombreCompleto;
  String cedula;
  int tipoContrato;
  int tiempoContrato;
  String correo;
  int password;
  int idRol;
  String cargo;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUsuario: json["idUsuario"],
        nombreCompleto: json["nombreCompleto"],
        cedula: json["cedula"],
        tipoContrato: json["tipoContrato"],
        tiempoContrato: json["tiempoContrato"],
        correo: json["correo"],
        password: json["password"],
        idRol: json["idRol"],
        cargo: json["cargo"],
      );

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "nombreCompleto": nombreCompleto,
        "cedula": cedula,
        "tipoContrato": tipoContrato,
        "tiempoContrato": tiempoContrato,
        "correo": correo,
        "password": password,
        "idRol": idRol,
        "cargo": cargo,
      };

//  getData(String cedula) {}
}
