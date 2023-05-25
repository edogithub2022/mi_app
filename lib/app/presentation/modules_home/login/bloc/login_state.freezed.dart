// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() inicia,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(Usuario usuario) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? inicia,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(Usuario usuario)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? inicia,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(Usuario usuario)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginStateLoading value) loading,
    required TResult Function(LoginStateInicia value) inicia,
    required TResult Function(LoginStateFailed value) failed,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateLoading value)? loading,
    TResult? Function(LoginStateInicia value)? inicia,
    TResult? Function(LoginStateFailed value)? failed,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateLoading value)? loading,
    TResult Function(LoginStateInicia value)? inicia,
    TResult Function(LoginStateFailed value)? failed,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginStateLoadingCopyWith<$Res> {
  factory _$$LoginStateLoadingCopyWith(
          _$LoginStateLoading value, $Res Function(_$LoginStateLoading) then) =
      __$$LoginStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginStateLoadingCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateLoading>
    implements _$$LoginStateLoadingCopyWith<$Res> {
  __$$LoginStateLoadingCopyWithImpl(
      _$LoginStateLoading _value, $Res Function(_$LoginStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginStateLoading implements LoginStateLoading {
  _$LoginStateLoading();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() inicia,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(Usuario usuario) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? inicia,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(Usuario usuario)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? inicia,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(Usuario usuario)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginStateLoading value) loading,
    required TResult Function(LoginStateInicia value) inicia,
    required TResult Function(LoginStateFailed value) failed,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateLoading value)? loading,
    TResult? Function(LoginStateInicia value)? inicia,
    TResult? Function(LoginStateFailed value)? failed,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateLoading value)? loading,
    TResult Function(LoginStateInicia value)? inicia,
    TResult Function(LoginStateFailed value)? failed,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginStateLoading implements LoginState {
  factory LoginStateLoading() = _$LoginStateLoading;
}

/// @nodoc
abstract class _$$LoginStateIniciaCopyWith<$Res> {
  factory _$$LoginStateIniciaCopyWith(
          _$LoginStateInicia value, $Res Function(_$LoginStateInicia) then) =
      __$$LoginStateIniciaCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginStateIniciaCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateInicia>
    implements _$$LoginStateIniciaCopyWith<$Res> {
  __$$LoginStateIniciaCopyWithImpl(
      _$LoginStateInicia _value, $Res Function(_$LoginStateInicia) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginStateInicia implements LoginStateInicia {
  _$LoginStateInicia();

  @override
  String toString() {
    return 'LoginState.inicia()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginStateInicia);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() inicia,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(Usuario usuario) loaded,
  }) {
    return inicia();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? inicia,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(Usuario usuario)? loaded,
  }) {
    return inicia?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? inicia,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(Usuario usuario)? loaded,
    required TResult orElse(),
  }) {
    if (inicia != null) {
      return inicia();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginStateLoading value) loading,
    required TResult Function(LoginStateInicia value) inicia,
    required TResult Function(LoginStateFailed value) failed,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateLoaded value) loaded,
  }) {
    return inicia(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateLoading value)? loading,
    TResult? Function(LoginStateInicia value)? inicia,
    TResult? Function(LoginStateFailed value)? failed,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateLoaded value)? loaded,
  }) {
    return inicia?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateLoading value)? loading,
    TResult Function(LoginStateInicia value)? inicia,
    TResult Function(LoginStateFailed value)? failed,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (inicia != null) {
      return inicia(this);
    }
    return orElse();
  }
}

abstract class LoginStateInicia implements LoginState {
  factory LoginStateInicia() = _$LoginStateInicia;
}

/// @nodoc
abstract class _$$LoginStateFailedCopyWith<$Res> {
  factory _$$LoginStateFailedCopyWith(
          _$LoginStateFailed value, $Res Function(_$LoginStateFailed) then) =
      __$$LoginStateFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({HttpRequestFailure failure});
}

/// @nodoc
class __$$LoginStateFailedCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateFailed>
    implements _$$LoginStateFailedCopyWith<$Res> {
  __$$LoginStateFailedCopyWithImpl(
      _$LoginStateFailed _value, $Res Function(_$LoginStateFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$LoginStateFailed(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as HttpRequestFailure,
    ));
  }
}

/// @nodoc

class _$LoginStateFailed implements LoginStateFailed {
  _$LoginStateFailed(this.failure);

  @override
  final HttpRequestFailure failure;

  @override
  String toString() {
    return 'LoginState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateFailed &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateFailedCopyWith<_$LoginStateFailed> get copyWith =>
      __$$LoginStateFailedCopyWithImpl<_$LoginStateFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() inicia,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(Usuario usuario) loaded,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? inicia,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(Usuario usuario)? loaded,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? inicia,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(Usuario usuario)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginStateLoading value) loading,
    required TResult Function(LoginStateInicia value) inicia,
    required TResult Function(LoginStateFailed value) failed,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateLoading value)? loading,
    TResult? Function(LoginStateInicia value)? inicia,
    TResult? Function(LoginStateFailed value)? failed,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateLoading value)? loading,
    TResult Function(LoginStateInicia value)? inicia,
    TResult Function(LoginStateFailed value)? failed,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class LoginStateFailed implements LoginState {
  factory LoginStateFailed(final HttpRequestFailure failure) =
      _$LoginStateFailed;

  HttpRequestFailure get failure;
  @JsonKey(ignore: true)
  _$$LoginStateFailedCopyWith<_$LoginStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginStateErrorCopyWith<$Res> {
  factory _$$LoginStateErrorCopyWith(
          _$LoginStateError value, $Res Function(_$LoginStateError) then) =
      __$$LoginStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> errors});
}

/// @nodoc
class __$$LoginStateErrorCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateError>
    implements _$$LoginStateErrorCopyWith<$Res> {
  __$$LoginStateErrorCopyWithImpl(
      _$LoginStateError _value, $Res Function(_$LoginStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$LoginStateError(
      null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$LoginStateError implements LoginStateError {
  _$LoginStateError(final List<String> errors) : _errors = errors;

  final List<String> _errors;
  @override
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'LoginState.error(errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateError &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateErrorCopyWith<_$LoginStateError> get copyWith =>
      __$$LoginStateErrorCopyWithImpl<_$LoginStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() inicia,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(Usuario usuario) loaded,
  }) {
    return error(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? inicia,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(Usuario usuario)? loaded,
  }) {
    return error?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? inicia,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(Usuario usuario)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginStateLoading value) loading,
    required TResult Function(LoginStateInicia value) inicia,
    required TResult Function(LoginStateFailed value) failed,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateLoading value)? loading,
    TResult? Function(LoginStateInicia value)? inicia,
    TResult? Function(LoginStateFailed value)? failed,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateLoading value)? loading,
    TResult Function(LoginStateInicia value)? inicia,
    TResult Function(LoginStateFailed value)? failed,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LoginStateError implements LoginState {
  factory LoginStateError(final List<String> errors) = _$LoginStateError;

  List<String> get errors;
  @JsonKey(ignore: true)
  _$$LoginStateErrorCopyWith<_$LoginStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginStateLoadedCopyWith<$Res> {
  factory _$$LoginStateLoadedCopyWith(
          _$LoginStateLoaded value, $Res Function(_$LoginStateLoaded) then) =
      __$$LoginStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Usuario usuario});
}

/// @nodoc
class __$$LoginStateLoadedCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateLoaded>
    implements _$$LoginStateLoadedCopyWith<$Res> {
  __$$LoginStateLoadedCopyWithImpl(
      _$LoginStateLoaded _value, $Res Function(_$LoginStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuario = null,
  }) {
    return _then(_$LoginStateLoaded(
      null == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as Usuario,
    ));
  }
}

/// @nodoc

class _$LoginStateLoaded implements LoginStateLoaded {
  _$LoginStateLoaded(this.usuario);

  @override
  final Usuario usuario;

  @override
  String toString() {
    return 'LoginState.loaded(usuario: $usuario)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateLoaded &&
            (identical(other.usuario, usuario) || other.usuario == usuario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usuario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateLoadedCopyWith<_$LoginStateLoaded> get copyWith =>
      __$$LoginStateLoadedCopyWithImpl<_$LoginStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() inicia,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(Usuario usuario) loaded,
  }) {
    return loaded(usuario);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? inicia,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(Usuario usuario)? loaded,
  }) {
    return loaded?.call(usuario);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? inicia,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(Usuario usuario)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(usuario);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginStateLoading value) loading,
    required TResult Function(LoginStateInicia value) inicia,
    required TResult Function(LoginStateFailed value) failed,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateLoading value)? loading,
    TResult? Function(LoginStateInicia value)? inicia,
    TResult? Function(LoginStateFailed value)? failed,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateLoading value)? loading,
    TResult Function(LoginStateInicia value)? inicia,
    TResult Function(LoginStateFailed value)? failed,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoginStateLoaded implements LoginState {
  factory LoginStateLoaded(final Usuario usuario) = _$LoginStateLoaded;

  Usuario get usuario;
  @JsonKey(ignore: true)
  _$$LoginStateLoadedCopyWith<_$LoginStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
