import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/erp/orden_compra/orden_compra_cab.dart';

abstract class GetOrdenCompraResult {}

class GetOrdenComprasSuccess extends GetOrdenCompraResult {
  GetOrdenComprasSuccess(this.ordenCompraCab);

  final List<OrdenCompraCab> ordenCompraCab;
}

class GetOrdenCompraSuccess extends GetOrdenCompraResult {
  GetOrdenCompraSuccess(this.ordenCompraCab);

  final OrdenCompraCab ordenCompraCab;
}

class GetOrdenCompraValidationError extends GetOrdenCompraResult {
  GetOrdenCompraValidationError(this.validationError);

  final List<String> validationError;
}

class GetOrdenCompraFailure extends GetOrdenCompraResult {
  GetOrdenCompraFailure(this.failure);

  final HttpRequestFailure failure;
}
