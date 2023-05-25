import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/login/usuario.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  factory ResetPasswordState.loading() = ResetPasswordStateLoading;
  factory ResetPasswordState.inicia() = ResetPasswordStateInicia;
  factory ResetPasswordState.failed(HttpRequestFailure failure) =
      ResetPasswordStateFailed;
  factory ResetPasswordState.error(List<String> errors) =
      ResetPasswordStateError;
  factory ResetPasswordState.loaded(Usuario usuario) = ResetPasswordStateLoaded;
}
