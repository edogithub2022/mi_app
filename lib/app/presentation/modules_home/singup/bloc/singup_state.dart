import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/login/usuario.dart';

part 'singup_state.freezed.dart';

@freezed
class SingUpState with _$SingUpState {
  factory SingUpState.loading() = SingUpStateLoading;
  factory SingUpState.inicia() = SingUpStateInicia;
  factory SingUpState.failed(HttpRequestFailure failure) = SingUpStateFailed;
  factory SingUpState.error(List<String> errors) = SingUpStateError;
  factory SingUpState.loaded(Usuario usuario) = SingUpStateLoaded;
}
