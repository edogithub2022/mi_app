import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/login/usuario_by_holding.dart';
import 'package:mi_app/app/domain/models/models.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState.loading() = UserStateLoading;
  factory UserState.failed(HttpRequestFailure failure) = UserStateFailed;
  factory UserState.error(List<String> errors) = UserStateError;
  factory UserState.loaded(List<Usuario> usuarios) = UserStateLoaded;
  factory UserState.loadedByHoldings(List<UsuarioByHolding> usuariosByHolding) =
      UserStateLoadedHolding;
}
