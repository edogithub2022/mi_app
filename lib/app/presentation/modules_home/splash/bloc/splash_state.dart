import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/domain/models/models.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  factory SplashState.loading() = SplashStateLoading;
  factory SplashState.failed(HttpRequestFailure failure) = SplashStateFailed;
  factory SplashState.error(List<String> errors) = SplashStateError;
  factory SplashState.loaded(Usuario usuario) = SplashStateLoaded;
}
