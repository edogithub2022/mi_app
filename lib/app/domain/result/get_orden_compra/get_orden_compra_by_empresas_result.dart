import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/erp/orden_compra/oc_by_empresas_returning.dart';
import 'package:mi_app/app/domain/models/erp/orden_compra/ocbyempresa.dart';

abstract class GetOrdenCompracByEmpresasResult {}

class GetOcByEmpresaSuccess extends GetOrdenCompracByEmpresasResult {
  GetOcByEmpresaSuccess(this.ocByEmpresa);

  final OcByEmpresa ocByEmpresa;
}

class GetOcByEmpresasSuccess extends GetOrdenCompracByEmpresasResult {
  GetOcByEmpresasSuccess(this.ocByEmpresas);

  final List<OcByEmpresa> ocByEmpresas;
}

class GetOcByEmpresaReturningSuccess extends GetOrdenCompracByEmpresasResult {
  GetOcByEmpresaReturningSuccess(this.ocByEmpresaReturning);

  final List<OcByEmpresaReturning> ocByEmpresaReturning;
}

class GetOcByEmpresasValidationError extends GetOrdenCompracByEmpresasResult {
  GetOcByEmpresasValidationError(this.validationError);

  final List<String> validationError;
}

class GetOcByEmpresasFailure extends GetOrdenCompracByEmpresasResult {
  GetOcByEmpresasFailure(this.failure);

  final HttpRequestFailure failure;
}
