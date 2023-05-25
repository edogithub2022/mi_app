// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
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
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateInicia value) inicia,
    required TResult Function(HomeStateFailed value) failed,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateInicia value)? inicia,
    TResult? Function(HomeStateFailed value)? failed,
    TResult? Function(HomeStateError value)? error,
    TResult? Function(HomeStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateInicia value)? inicia,
    TResult Function(HomeStateFailed value)? failed,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HomeStateLoadingCopyWith<$Res> {
  factory _$$HomeStateLoadingCopyWith(
          _$HomeStateLoading value, $Res Function(_$HomeStateLoading) then) =
      __$$HomeStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateLoadingCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoading>
    implements _$$HomeStateLoadingCopyWith<$Res> {
  __$$HomeStateLoadingCopyWithImpl(
      _$HomeStateLoading _value, $Res Function(_$HomeStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeStateLoading implements HomeStateLoading {
  _$HomeStateLoading();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateLoading);
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
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateInicia value) inicia,
    required TResult Function(HomeStateFailed value) failed,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateInicia value)? inicia,
    TResult? Function(HomeStateFailed value)? failed,
    TResult? Function(HomeStateError value)? error,
    TResult? Function(HomeStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateInicia value)? inicia,
    TResult Function(HomeStateFailed value)? failed,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeStateLoading implements HomeState {
  factory HomeStateLoading() = _$HomeStateLoading;
}

/// @nodoc
abstract class _$$HomeStateIniciaCopyWith<$Res> {
  factory _$$HomeStateIniciaCopyWith(
          _$HomeStateInicia value, $Res Function(_$HomeStateInicia) then) =
      __$$HomeStateIniciaCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateIniciaCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateInicia>
    implements _$$HomeStateIniciaCopyWith<$Res> {
  __$$HomeStateIniciaCopyWithImpl(
      _$HomeStateInicia _value, $Res Function(_$HomeStateInicia) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeStateInicia implements HomeStateInicia {
  _$HomeStateInicia();

  @override
  String toString() {
    return 'HomeState.inicia()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateInicia);
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
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateInicia value) inicia,
    required TResult Function(HomeStateFailed value) failed,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateLoaded value) loaded,
  }) {
    return inicia(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateInicia value)? inicia,
    TResult? Function(HomeStateFailed value)? failed,
    TResult? Function(HomeStateError value)? error,
    TResult? Function(HomeStateLoaded value)? loaded,
  }) {
    return inicia?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateInicia value)? inicia,
    TResult Function(HomeStateFailed value)? failed,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (inicia != null) {
      return inicia(this);
    }
    return orElse();
  }
}

abstract class HomeStateInicia implements HomeState {
  factory HomeStateInicia() = _$HomeStateInicia;
}

/// @nodoc
abstract class _$$HomeStateFailedCopyWith<$Res> {
  factory _$$HomeStateFailedCopyWith(
          _$HomeStateFailed value, $Res Function(_$HomeStateFailed) then) =
      __$$HomeStateFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({HttpRequestFailure failure});
}

/// @nodoc
class __$$HomeStateFailedCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateFailed>
    implements _$$HomeStateFailedCopyWith<$Res> {
  __$$HomeStateFailedCopyWithImpl(
      _$HomeStateFailed _value, $Res Function(_$HomeStateFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$HomeStateFailed(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as HttpRequestFailure,
    ));
  }
}

/// @nodoc

class _$HomeStateFailed implements HomeStateFailed {
  _$HomeStateFailed(this.failure);

  @override
  final HttpRequestFailure failure;

  @override
  String toString() {
    return 'HomeState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateFailed &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateFailedCopyWith<_$HomeStateFailed> get copyWith =>
      __$$HomeStateFailedCopyWithImpl<_$HomeStateFailed>(this, _$identity);

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
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateInicia value) inicia,
    required TResult Function(HomeStateFailed value) failed,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateInicia value)? inicia,
    TResult? Function(HomeStateFailed value)? failed,
    TResult? Function(HomeStateError value)? error,
    TResult? Function(HomeStateLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateInicia value)? inicia,
    TResult Function(HomeStateFailed value)? failed,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class HomeStateFailed implements HomeState {
  factory HomeStateFailed(final HttpRequestFailure failure) = _$HomeStateFailed;

  HttpRequestFailure get failure;
  @JsonKey(ignore: true)
  _$$HomeStateFailedCopyWith<_$HomeStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeStateErrorCopyWith<$Res> {
  factory _$$HomeStateErrorCopyWith(
          _$HomeStateError value, $Res Function(_$HomeStateError) then) =
      __$$HomeStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> errors});
}

/// @nodoc
class __$$HomeStateErrorCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateError>
    implements _$$HomeStateErrorCopyWith<$Res> {
  __$$HomeStateErrorCopyWithImpl(
      _$HomeStateError _value, $Res Function(_$HomeStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$HomeStateError(
      null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$HomeStateError implements HomeStateError {
  _$HomeStateError(final List<String> errors) : _errors = errors;

  final List<String> _errors;
  @override
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'HomeState.error(errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateError &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateErrorCopyWith<_$HomeStateError> get copyWith =>
      __$$HomeStateErrorCopyWithImpl<_$HomeStateError>(this, _$identity);

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
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateInicia value) inicia,
    required TResult Function(HomeStateFailed value) failed,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateInicia value)? inicia,
    TResult? Function(HomeStateFailed value)? failed,
    TResult? Function(HomeStateError value)? error,
    TResult? Function(HomeStateLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateInicia value)? inicia,
    TResult Function(HomeStateFailed value)? failed,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeStateError implements HomeState {
  factory HomeStateError(final List<String> errors) = _$HomeStateError;

  List<String> get errors;
  @JsonKey(ignore: true)
  _$$HomeStateErrorCopyWith<_$HomeStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeStateLoadedCopyWith<$Res> {
  factory _$$HomeStateLoadedCopyWith(
          _$HomeStateLoaded value, $Res Function(_$HomeStateLoaded) then) =
      __$$HomeStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Usuario usuario});
}

/// @nodoc
class __$$HomeStateLoadedCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoaded>
    implements _$$HomeStateLoadedCopyWith<$Res> {
  __$$HomeStateLoadedCopyWithImpl(
      _$HomeStateLoaded _value, $Res Function(_$HomeStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuario = null,
  }) {
    return _then(_$HomeStateLoaded(
      null == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as Usuario,
    ));
  }
}

/// @nodoc

class _$HomeStateLoaded implements HomeStateLoaded {
  _$HomeStateLoaded(this.usuario);

  @override
  final Usuario usuario;

  @override
  String toString() {
    return 'HomeState.loaded(usuario: $usuario)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateLoaded &&
            (identical(other.usuario, usuario) || other.usuario == usuario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usuario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateLoadedCopyWith<_$HomeStateLoaded> get copyWith =>
      __$$HomeStateLoadedCopyWithImpl<_$HomeStateLoaded>(this, _$identity);

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
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateInicia value) inicia,
    required TResult Function(HomeStateFailed value) failed,
    required TResult Function(HomeStateError value) error,
    required TResult Function(HomeStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateInicia value)? inicia,
    TResult? Function(HomeStateFailed value)? failed,
    TResult? Function(HomeStateError value)? error,
    TResult? Function(HomeStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateInicia value)? inicia,
    TResult Function(HomeStateFailed value)? failed,
    TResult Function(HomeStateError value)? error,
    TResult Function(HomeStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeStateLoaded implements HomeState {
  factory HomeStateLoaded(final Usuario usuario) = _$HomeStateLoaded;

  Usuario get usuario;
  @JsonKey(ignore: true)
  _$$HomeStateLoadedCopyWith<_$HomeStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
