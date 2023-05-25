import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/login/usuario.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState.loading() = LoginStateLoading;
  factory LoginState.inicia() = LoginStateInicia;
  factory LoginState.failed(HttpRequestFailure failure) = LoginStateFailed;
  factory LoginState.error(List<String> errors) = LoginStateError;
  factory LoginState.loaded(Usuario usuario) = LoginStateLoaded;
}
