// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'singup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SingUpState {
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
    required TResult Function(SingUpStateLoading value) loading,
    required TResult Function(SingUpStateInicia value) inicia,
    required TResult Function(SingUpStateFailed value) failed,
    required TResult Function(SingUpStateError value) error,
    required TResult Function(SingUpStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingUpStateLoading value)? loading,
    TResult? Function(SingUpStateInicia value)? inicia,
    TResult? Function(SingUpStateFailed value)? failed,
    TResult? Function(SingUpStateError value)? error,
    TResult? Function(SingUpStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingUpStateLoading value)? loading,
    TResult Function(SingUpStateInicia value)? inicia,
    TResult Function(SingUpStateFailed value)? failed,
    TResult Function(SingUpStateError value)? error,
    TResult Function(SingUpStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingUpStateCopyWith<$Res> {
  factory $SingUpStateCopyWith(
          SingUpState value, $Res Function(SingUpState) then) =
      _$SingUpStateCopyWithImpl<$Res, SingUpState>;
}

/// @nodoc
class _$SingUpStateCopyWithImpl<$Res, $Val extends SingUpState>
    implements $SingUpStateCopyWith<$Res> {
  _$SingUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SingUpStateLoadingCopyWith<$Res> {
  factory _$$SingUpStateLoadingCopyWith(_$SingUpStateLoading value,
          $Res Function(_$SingUpStateLoading) then) =
      __$$SingUpStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingUpStateLoadingCopyWithImpl<$Res>
    extends _$SingUpStateCopyWithImpl<$Res, _$SingUpStateLoading>
    implements _$$SingUpStateLoadingCopyWith<$Res> {
  __$$SingUpStateLoadingCopyWithImpl(
      _$SingUpStateLoading _value, $Res Function(_$SingUpStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingUpStateLoading implements SingUpStateLoading {
  _$SingUpStateLoading();

  @override
  String toString() {
    return 'SingUpState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SingUpStateLoading);
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
    required TResult Function(SingUpStateLoading value) loading,
    required TResult Function(SingUpStateInicia value) inicia,
    required TResult Function(SingUpStateFailed value) failed,
    required TResult Function(SingUpStateError value) error,
    required TResult Function(SingUpStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingUpStateLoading value)? loading,
    TResult? Function(SingUpStateInicia value)? inicia,
    TResult? Function(SingUpStateFailed value)? failed,
    TResult? Function(SingUpStateError value)? error,
    TResult? Function(SingUpStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingUpStateLoading value)? loading,
    TResult Function(SingUpStateInicia value)? inicia,
    TResult Function(SingUpStateFailed value)? failed,
    TResult Function(SingUpStateError value)? error,
    TResult Function(SingUpStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SingUpStateLoading implements SingUpState {
  factory SingUpStateLoading() = _$SingUpStateLoading;
}

/// @nodoc
abstract class _$$SingUpStateIniciaCopyWith<$Res> {
  factory _$$SingUpStateIniciaCopyWith(
          _$SingUpStateInicia value, $Res Function(_$SingUpStateInicia) then) =
      __$$SingUpStateIniciaCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingUpStateIniciaCopyWithImpl<$Res>
    extends _$SingUpStateCopyWithImpl<$Res, _$SingUpStateInicia>
    implements _$$SingUpStateIniciaCopyWith<$Res> {
  __$$SingUpStateIniciaCopyWithImpl(
      _$SingUpStateInicia _value, $Res Function(_$SingUpStateInicia) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingUpStateInicia implements SingUpStateInicia {
  _$SingUpStateInicia();

  @override
  String toString() {
    return 'SingUpState.inicia()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SingUpStateInicia);
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
    required TResult Function(SingUpStateLoading value) loading,
    required TResult Function(SingUpStateInicia value) inicia,
    required TResult Function(SingUpStateFailed value) failed,
    required TResult Function(SingUpStateError value) error,
    required TResult Function(SingUpStateLoaded value) loaded,
  }) {
    return inicia(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingUpStateLoading value)? loading,
    TResult? Function(SingUpStateInicia value)? inicia,
    TResult? Function(SingUpStateFailed value)? failed,
    TResult? Function(SingUpStateError value)? error,
    TResult? Function(SingUpStateLoaded value)? loaded,
  }) {
    return inicia?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingUpStateLoading value)? loading,
    TResult Function(SingUpStateInicia value)? inicia,
    TResult Function(SingUpStateFailed value)? failed,
    TResult Function(SingUpStateError value)? error,
    TResult Function(SingUpStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (inicia != null) {
      return inicia(this);
    }
    return orElse();
  }
}

abstract class SingUpStateInicia implements SingUpState {
  factory SingUpStateInicia() = _$SingUpStateInicia;
}

/// @nodoc
abstract class _$$SingUpStateFailedCopyWith<$Res> {
  factory _$$SingUpStateFailedCopyWith(
          _$SingUpStateFailed value, $Res Function(_$SingUpStateFailed) then) =
      __$$SingUpStateFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({HttpRequestFailure failure});
}

/// @nodoc
class __$$SingUpStateFailedCopyWithImpl<$Res>
    extends _$SingUpStateCopyWithImpl<$Res, _$SingUpStateFailed>
    implements _$$SingUpStateFailedCopyWith<$Res> {
  __$$SingUpStateFailedCopyWithImpl(
      _$SingUpStateFailed _value, $Res Function(_$SingUpStateFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$SingUpStateFailed(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as HttpRequestFailure,
    ));
  }
}

/// @nodoc

class _$SingUpStateFailed implements SingUpStateFailed {
  _$SingUpStateFailed(this.failure);

  @override
  final HttpRequestFailure failure;

  @override
  String toString() {
    return 'SingUpState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingUpStateFailed &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingUpStateFailedCopyWith<_$SingUpStateFailed> get copyWith =>
      __$$SingUpStateFailedCopyWithImpl<_$SingUpStateFailed>(this, _$identity);

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
    required TResult Function(SingUpStateLoading value) loading,
    required TResult Function(SingUpStateInicia value) inicia,
    required TResult Function(SingUpStateFailed value) failed,
    required TResult Function(SingUpStateError value) error,
    required TResult Function(SingUpStateLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingUpStateLoading value)? loading,
    TResult? Function(SingUpStateInicia value)? inicia,
    TResult? Function(SingUpStateFailed value)? failed,
    TResult? Function(SingUpStateError value)? error,
    TResult? Function(SingUpStateLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingUpStateLoading value)? loading,
    TResult Function(SingUpStateInicia value)? inicia,
    TResult Function(SingUpStateFailed value)? failed,
    TResult Function(SingUpStateError value)? error,
    TResult Function(SingUpStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class SingUpStateFailed implements SingUpState {
  factory SingUpStateFailed(final HttpRequestFailure failure) =
      _$SingUpStateFailed;

  HttpRequestFailure get failure;
  @JsonKey(ignore: true)
  _$$SingUpStateFailedCopyWith<_$SingUpStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SingUpStateErrorCopyWith<$Res> {
  factory _$$SingUpStateErrorCopyWith(
          _$SingUpStateError value, $Res Function(_$SingUpStateError) then) =
      __$$SingUpStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> errors});
}

/// @nodoc
class __$$SingUpStateErrorCopyWithImpl<$Res>
    extends _$SingUpStateCopyWithImpl<$Res, _$SingUpStateError>
    implements _$$SingUpStateErrorCopyWith<$Res> {
  __$$SingUpStateErrorCopyWithImpl(
      _$SingUpStateError _value, $Res Function(_$SingUpStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$SingUpStateError(
      null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SingUpStateError implements SingUpStateError {
  _$SingUpStateError(final List<String> errors) : _errors = errors;

  final List<String> _errors;
  @override
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'SingUpState.error(errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingUpStateError &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingUpStateErrorCopyWith<_$SingUpStateError> get copyWith =>
      __$$SingUpStateErrorCopyWithImpl<_$SingUpStateError>(this, _$identity);

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
    required TResult Function(SingUpStateLoading value) loading,
    required TResult Function(SingUpStateInicia value) inicia,
    required TResult Function(SingUpStateFailed value) failed,
    required TResult Function(SingUpStateError value) error,
    required TResult Function(SingUpStateLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingUpStateLoading value)? loading,
    TResult? Function(SingUpStateInicia value)? inicia,
    TResult? Function(SingUpStateFailed value)? failed,
    TResult? Function(SingUpStateError value)? error,
    TResult? Function(SingUpStateLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingUpStateLoading value)? loading,
    TResult Function(SingUpStateInicia value)? inicia,
    TResult Function(SingUpStateFailed value)? failed,
    TResult Function(SingUpStateError value)? error,
    TResult Function(SingUpStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SingUpStateError implements SingUpState {
  factory SingUpStateError(final List<String> errors) = _$SingUpStateError;

  List<String> get errors;
  @JsonKey(ignore: true)
  _$$SingUpStateErrorCopyWith<_$SingUpStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SingUpStateLoadedCopyWith<$Res> {
  factory _$$SingUpStateLoadedCopyWith(
          _$SingUpStateLoaded value, $Res Function(_$SingUpStateLoaded) then) =
      __$$SingUpStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Usuario usuario});
}

/// @nodoc
class __$$SingUpStateLoadedCopyWithImpl<$Res>
    extends _$SingUpStateCopyWithImpl<$Res, _$SingUpStateLoaded>
    implements _$$SingUpStateLoadedCopyWith<$Res> {
  __$$SingUpStateLoadedCopyWithImpl(
      _$SingUpStateLoaded _value, $Res Function(_$SingUpStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuario = null,
  }) {
    return _then(_$SingUpStateLoaded(
      null == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as Usuario,
    ));
  }
}

/// @nodoc

class _$SingUpStateLoaded implements SingUpStateLoaded {
  _$SingUpStateLoaded(this.usuario);

  @override
  final Usuario usuario;

  @override
  String toString() {
    return 'SingUpState.loaded(usuario: $usuario)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingUpStateLoaded &&
            (identical(other.usuario, usuario) || other.usuario == usuario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usuario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingUpStateLoadedCopyWith<_$SingUpStateLoaded> get copyWith =>
      __$$SingUpStateLoadedCopyWithImpl<_$SingUpStateLoaded>(this, _$identity);

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
    required TResult Function(SingUpStateLoading value) loading,
    required TResult Function(SingUpStateInicia value) inicia,
    required TResult Function(SingUpStateFailed value) failed,
    required TResult Function(SingUpStateError value) error,
    required TResult Function(SingUpStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingUpStateLoading value)? loading,
    TResult? Function(SingUpStateInicia value)? inicia,
    TResult? Function(SingUpStateFailed value)? failed,
    TResult? Function(SingUpStateError value)? error,
    TResult? Function(SingUpStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingUpStateLoading value)? loading,
    TResult Function(SingUpStateInicia value)? inicia,
    TResult Function(SingUpStateFailed value)? failed,
    TResult Function(SingUpStateError value)? error,
    TResult Function(SingUpStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SingUpStateLoaded implements SingUpState {
  factory SingUpStateLoaded(final Usuario usuario) = _$SingUpStateLoaded;

  Usuario get usuario;
  @JsonKey(ignore: true)
  _$$SingUpStateLoadedCopyWith<_$SingUpStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
