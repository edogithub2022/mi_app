class UpdateUserData {
  final String uuid;
  final String nombre;
  final String rut;
  final String correo;
  final String rol;
  final bool estado;
  final String imageUrl;
  final String holding;

  UpdateUserData({
    required this.uuid,
    required this.nombre,
    required this.rut,
    required this.correo,
    required this.rol,
    required this.estado,
    required this.imageUrl,
    required this.holding,
  });
}
