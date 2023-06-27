import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/login/usuario_by_holding.dart';
import 'package:mi_app/app/domain/models/models.dart';

abstract class GetUsuariosResult {}

class GetUsuarioSuccess extends GetUsuariosResult {
  GetUsuarioSuccess(this.usuario);

  final Usuario usuario;
}

class GetUsuariosByHoldingSuccess extends GetUsuariosResult {
  GetUsuariosByHoldingSuccess(this.usuarios);

  final List<UsuarioByHolding> usuarios;
}

class GetUsuariosSuccess extends GetUsuariosResult {
  GetUsuariosSuccess(this.usuarios);

  final List<Usuario> usuarios;
}

class GetUsuariosValidationError extends GetUsuariosResult {
  GetUsuariosValidationError(this.validationError);

  final List<String> validationError;
}

class GetUsuariosFailure extends GetUsuariosResult {
  GetUsuariosFailure(this.failure);

  final HttpRequestFailure failure;
}
