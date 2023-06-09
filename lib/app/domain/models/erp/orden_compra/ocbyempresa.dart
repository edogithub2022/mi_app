class OcByEmpresa {
  int codempresa;
  String razonsocial;
  int ocs;

  OcByEmpresa({
    required this.codempresa,
    required this.razonsocial,
    required this.ocs,
  });

  factory OcByEmpresa.fromJson(Map<String, dynamic> json) => OcByEmpresa(
        codempresa: json["CODEMPRESA"],
        razonsocial: json["RAZONSOCIAL"],
        ocs: json["OCS"],
      );

  Map<String, dynamic> toJson() => {
        "CODEMPRESA": codempresa,
        "RAZONSOCIAL": razonsocial,
        "OCS": ocs,
      };
}
