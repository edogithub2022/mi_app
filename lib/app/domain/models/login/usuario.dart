import 'dart:convert';

class Usuario {
  Usuario({
    required this.uuid,
    required this.rut,
    required this.nombre,
    required this.correo,
    required this.password,
    required this.rol,
    required this.estado,
    required this.createdAt,
    required this.updatedAt,
    this.imageUrl,
    this.holding,
    this.urlLogo,
  });

  String uuid;
  String rut;
  String nombre;
  String correo;
  String password;
  String rol;
  bool estado;
  DateTime createdAt;
  DateTime updatedAt;
  String? imageUrl;
  String? holding;
  String? urlLogo;

  factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        uuid: json["uuid"],
        rut: json["rut"],
        nombre: json["nombre"],
        correo: json["correo"],
        password: json["password"],
        rol: json["rol"],
        estado: json["estado"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        imageUrl: json["imageUrl"],
        holding: json["holding"],
        urlLogo: json["urlLogo"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "rut": rut,
        "nombre": nombre,
        "correo": correo,
        "password": password,
        "rol": rol,
        "estado": estado,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "imageUrl": imageUrl,
        "holding": holding,
        "urlLogo": urlLogo,
      };

  Usuario copy() => Usuario(
        uuid: uuid,
        rut: rut,
        nombre: nombre,
        correo: correo,
        password: password,
        rol: rol,
        estado: estado,
        createdAt: createdAt,
        updatedAt: updatedAt,
        imageUrl: imageUrl,
        holding: holding,
        urlLogo: urlLogo,
      );
}
