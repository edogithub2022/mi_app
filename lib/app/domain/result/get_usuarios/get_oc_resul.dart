import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/models.dart';

abstract class GetOCResult {}

class GetOCSuccess extends GetOCResult {
  GetOCSuccess(this.usuario);

  final Usuario usuario;
}

class GetOCsSuccess extends GetOCResult {
  GetOCsSuccess(this.usuarios);

  final List<Usuario> usuarios;
}

class GetOCValidationError extends GetOCResult {
  GetOCValidationError(this.validationError);

  final List<String> validationError;
}

class GetOCFailure extends GetOCResult {
  GetOCFailure(this.failure);

  final HttpRequestFailure failure;
}
