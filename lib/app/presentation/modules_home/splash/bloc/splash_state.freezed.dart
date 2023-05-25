// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(Usuario usuario) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(Usuario usuario)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(Usuario usuario)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashStateLoading value) loading,
    required TResult Function(SplashStateFailed value) failed,
    required TResult Function(SplashStateError value) error,
    required TResult Function(SplashStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashStateLoading value)? loading,
    TResult? Function(SplashStateFailed value)? failed,
    TResult? Function(SplashStateError value)? error,
    TResult? Function(SplashStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashStateLoading value)? loading,
    TResult Function(SplashStateFailed value)? failed,
    TResult Function(SplashStateError value)? error,
    TResult Function(SplashStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res, SplashState>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res, $Val extends SplashState>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SplashStateLoadingCopyWith<$Res> {
  factory _$$SplashStateLoadingCopyWith(_$SplashStateLoading value,
          $Res Function(_$SplashStateLoading) then) =
      __$$SplashStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashStateLoadingCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashStateLoading>
    implements _$$SplashStateLoadingCopyWith<$Res> {
  __$$SplashStateLoadingCopyWithImpl(
      _$SplashStateLoading _value, $Res Function(_$SplashStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SplashStateLoading implements SplashStateLoading {
  _$SplashStateLoading();

  @override
  String toString() {
    return 'SplashState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SplashStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
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
    required TResult Function(SplashStateLoading value) loading,
    required TResult Function(SplashStateFailed value) failed,
    required TResult Function(SplashStateError value) error,
    required TResult Function(SplashStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashStateLoading value)? loading,
    TResult? Function(SplashStateFailed value)? failed,
    TResult? Function(SplashStateError value)? error,
    TResult? Function(SplashStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashStateLoading value)? loading,
    TResult Function(SplashStateFailed value)? failed,
    TResult Function(SplashStateError value)? error,
    TResult Function(SplashStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SplashStateLoading implements SplashState {
  factory SplashStateLoading() = _$SplashStateLoading;
}

/// @nodoc
abstract class _$$SplashStateFailedCopyWith<$Res> {
  factory _$$SplashStateFailedCopyWith(
          _$SplashStateFailed value, $Res Function(_$SplashStateFailed) then) =
      __$$SplashStateFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({HttpRequestFailure failure});
}

/// @nodoc
class __$$SplashStateFailedCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashStateFailed>
    implements _$$SplashStateFailedCopyWith<$Res> {
  __$$SplashStateFailedCopyWithImpl(
      _$SplashStateFailed _value, $Res Function(_$SplashStateFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$SplashStateFailed(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as HttpRequestFailure,
    ));
  }
}

/// @nodoc

class _$SplashStateFailed implements SplashStateFailed {
  _$SplashStateFailed(this.failure);

  @override
  final HttpRequestFailure failure;

  @override
  String toString() {
    return 'SplashState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashStateFailed &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashStateFailedCopyWith<_$SplashStateFailed> get copyWith =>
      __$$SplashStateFailedCopyWithImpl<_$SplashStateFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
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
    required TResult Function(SplashStateLoading value) loading,
    required TResult Function(SplashStateFailed value) failed,
    required TResult Function(SplashStateError value) error,
    required TResult Function(SplashStateLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashStateLoading value)? loading,
    TResult? Function(SplashStateFailed value)? failed,
    TResult? Function(SplashStateError value)? error,
    TResult? Function(SplashStateLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashStateLoading value)? loading,
    TResult Function(SplashStateFailed value)? failed,
    TResult Function(SplashStateError value)? error,
    TResult Function(SplashStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class SplashStateFailed implements SplashState {
  factory SplashStateFailed(final HttpRequestFailure failure) =
      _$SplashStateFailed;

  HttpRequestFailure get failure;
  @JsonKey(ignore: true)
  _$$SplashStateFailedCopyWith<_$SplashStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SplashStateErrorCopyWith<$Res> {
  factory _$$SplashStateErrorCopyWith(
          _$SplashStateError value, $Res Function(_$SplashStateError) then) =
      __$$SplashStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> errors});
}

/// @nodoc
class __$$SplashStateErrorCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashStateError>
    implements _$$SplashStateErrorCopyWith<$Res> {
  __$$SplashStateErrorCopyWithImpl(
      _$SplashStateError _value, $Res Function(_$SplashStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$SplashStateError(
      null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SplashStateError implements SplashStateError {
  _$SplashStateError(final List<String> errors) : _errors = errors;

  final List<String> _errors;
  @override
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'SplashState.error(errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashStateError &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashStateErrorCopyWith<_$SplashStateError> get copyWith =>
      __$$SplashStateErrorCopyWithImpl<_$SplashStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
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
    required TResult Function(SplashStateLoading value) loading,
    required TResult Function(SplashStateFailed value) failed,
    required TResult Function(SplashStateError value) error,
    required TResult Function(SplashStateLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashStateLoading value)? loading,
    TResult? Function(SplashStateFailed value)? failed,
    TResult? Function(SplashStateError value)? error,
    TResult? Function(SplashStateLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashStateLoading value)? loading,
    TResult Function(SplashStateFailed value)? failed,
    TResult Function(SplashStateError value)? error,
    TResult Function(SplashStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SplashStateError implements SplashState {
  factory SplashStateError(final List<String> errors) = _$SplashStateError;

  List<String> get errors;
  @JsonKey(ignore: true)
  _$$SplashStateErrorCopyWith<_$SplashStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SplashStateLoadedCopyWith<$Res> {
  factory _$$SplashStateLoadedCopyWith(
          _$SplashStateLoaded value, $Res Function(_$SplashStateLoaded) then) =
      __$$SplashStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Usuario usuario});
}

/// @nodoc
class __$$SplashStateLoadedCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashStateLoaded>
    implements _$$SplashStateLoadedCopyWith<$Res> {
  __$$SplashStateLoadedCopyWithImpl(
      _$SplashStateLoaded _value, $Res Function(_$SplashStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuario = null,
  }) {
    return _then(_$SplashStateLoaded(
      null == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as Usuario,
    ));
  }
}

/// @nodoc

class _$SplashStateLoaded implements SplashStateLoaded {
  _$SplashStateLoaded(this.usuario);

  @override
  final Usuario usuario;

  @override
  String toString() {
    return 'SplashState.loaded(usuario: $usuario)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashStateLoaded &&
            (identical(other.usuario, usuario) || other.usuario == usuario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usuario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashStateLoadedCopyWith<_$SplashStateLoaded> get copyWith =>
      __$$SplashStateLoadedCopyWithImpl<_$SplashStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
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
    required TResult Function(SplashStateLoading value) loading,
    required TResult Function(SplashStateFailed value) failed,
    required TResult Function(SplashStateError value) error,
    required TResult Function(SplashStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashStateLoading value)? loading,
    TResult? Function(SplashStateFailed value)? failed,
    TResult? Function(SplashStateError value)? error,
    TResult? Function(SplashStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashStateLoading value)? loading,
    TResult Function(SplashStateFailed value)? failed,
    TResult Function(SplashStateError value)? error,
    TResult Function(SplashStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SplashStateLoaded implements SplashState {
  factory SplashStateLoaded(final Usuario usuario) = _$SplashStateLoaded;

  Usuario get usuario;
  @JsonKey(ignore: true)
  _$$SplashStateLoadedCopyWith<_$SplashStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
