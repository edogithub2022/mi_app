import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/models.dart';

abstract class GetOrdenCompraTotalesResult {}

class GetOrdenCompraTotalSuccess extends GetOrdenCompraTotalesResult {
  GetOrdenCompraTotalSuccess(this.ordenCompraTotal);

  final OrdenCompraTotales ordenCompraTotal;
}

class GetOrdenComprasTotalesSuccess extends GetOrdenCompraTotalesResult {
  GetOrdenComprasTotalesSuccess(this.ordenCompraTotales);

  final List<OrdenCompraTotales> ordenCompraTotales;
}

class GetOrdenCompraCabReturningSuccess extends GetOrdenCompraTotalesResult {
  GetOrdenCompraCabReturningSuccess(this.ordenCompraCabReturning);

  final List<OrdenCompraCabReturning> ordenCompraCabReturning;
}

class GetOrdenCompraTotalesValidationError extends GetOrdenCompraTotalesResult {
  GetOrdenCompraTotalesValidationError(this.validationError);

  final List<String> validationError;
}

class GetOrdenCompraTotalesFailure extends GetOrdenCompraTotalesResult {
  GetOrdenCompraTotalesFailure(this.failure);

  final HttpRequestFailure failure;
}
