class OcByEmpresaReturning {
  OcByEmpresaReturning({
    required this.codempresa,
    required this.razonsocial,
    required this.ocs,
  });

  int codempresa;
  String razonsocial;
  int ocs;

  factory OcByEmpresaReturning.fromJson(Map<String, dynamic> json) =>
      OcByEmpresaReturning(
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
