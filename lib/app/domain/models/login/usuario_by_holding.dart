class UsuarioByHolding {
  String holding;
  int total;

  UsuarioByHolding({
    required this.holding,
    required this.total,
  });

  factory UsuarioByHolding.fromJson(Map<String, dynamic> json) =>
      UsuarioByHolding(
        holding: json["holding"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "holding": holding,
        "total": total,
      };
}
