import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/login/usuario.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState.loading() = HomeStateLoading;
  factory HomeState.inicia() = HomeStateInicia;
  factory HomeState.failed(HttpRequestFailure failure) = HomeStateFailed;
  factory HomeState.error(List<String> errors) = HomeStateError;
  factory HomeState.loaded(Usuario usuario) = HomeStateLoaded;
}
