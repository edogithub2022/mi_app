import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/models.dart';

abstract class GetHoldingResult {}

class GetHoldingSuccess extends GetHoldingResult {
  GetHoldingSuccess(this.holding);

  final Holding holding;
}

class GetHoldingsSuccess extends GetHoldingResult {
  GetHoldingsSuccess(this.holdings);

  final List<Holding> holdings;
}

class GetHoldingValidationError extends GetHoldingResult {
  GetHoldingValidationError(this.validationError);

  final List<String> validationError;
}

class GetHoldingFailure extends GetHoldingResult {
  GetHoldingFailure(this.failure);

  final HttpRequestFailure failure;
}
