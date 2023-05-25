import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:mi_app/app/domain/models/models.dart';

Future<void> loadedUserSession(
  BuildContext context, {
  required Usuario usuario,
}) async {
  //Establecer acceso de usuario segun rol
  //guardandolo en un global provider
  Map<String, bool> access = {
    'usuarios': false,
    'usuariosPlus': false,
  };
  switch (usuario.rol) {
    case 'ADMIN_ROLE':
      access['usuarios'] = true;
      break;
    case 'SUPERADMIN_ROLE':
      access['usuarios'] = true;
      access['usuariosPlus'] = true;
      break;
    default:
  }

  context.read<SessionProvider>().setAccess(access: access);

  //Guardar el usuario autenticado en provider
  context.read<SessionProvider>().setUsuario(usuario: usuario);
}
