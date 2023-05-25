// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(List<Usuario> usuarios) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(List<Usuario> usuarios)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(List<Usuario> usuarios)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailed value) failed,
    required TResult Function(UserStateError value) error,
    required TResult Function(UserStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailed value)? failed,
    TResult? Function(UserStateError value)? error,
    TResult? Function(UserStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailed value)? failed,
    TResult Function(UserStateError value)? error,
    TResult Function(UserStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserStateLoadingCopyWith<$Res> {
  factory _$$UserStateLoadingCopyWith(
          _$UserStateLoading value, $Res Function(_$UserStateLoading) then) =
      __$$UserStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserStateLoadingCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateLoading>
    implements _$$UserStateLoadingCopyWith<$Res> {
  __$$UserStateLoadingCopyWithImpl(
      _$UserStateLoading _value, $Res Function(_$UserStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserStateLoading implements UserStateLoading {
  _$UserStateLoading();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(List<Usuario> usuarios) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(List<Usuario> usuarios)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(List<Usuario> usuarios)? loaded,
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
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailed value) failed,
    required TResult Function(UserStateError value) error,
    required TResult Function(UserStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailed value)? failed,
    TResult? Function(UserStateError value)? error,
    TResult? Function(UserStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailed value)? failed,
    TResult Function(UserStateError value)? error,
    TResult Function(UserStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserStateLoading implements UserState {
  factory UserStateLoading() = _$UserStateLoading;
}

/// @nodoc
abstract class _$$UserStateFailedCopyWith<$Res> {
  factory _$$UserStateFailedCopyWith(
          _$UserStateFailed value, $Res Function(_$UserStateFailed) then) =
      __$$UserStateFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({HttpRequestFailure failure});
}

/// @nodoc
class __$$UserStateFailedCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateFailed>
    implements _$$UserStateFailedCopyWith<$Res> {
  __$$UserStateFailedCopyWithImpl(
      _$UserStateFailed _value, $Res Function(_$UserStateFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$UserStateFailed(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as HttpRequestFailure,
    ));
  }
}

/// @nodoc

class _$UserStateFailed implements UserStateFailed {
  _$UserStateFailed(this.failure);

  @override
  final HttpRequestFailure failure;

  @override
  String toString() {
    return 'UserState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateFailed &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateFailedCopyWith<_$UserStateFailed> get copyWith =>
      __$$UserStateFailedCopyWithImpl<_$UserStateFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(List<Usuario> usuarios) loaded,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(List<Usuario> usuarios)? loaded,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(List<Usuario> usuarios)? loaded,
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
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailed value) failed,
    required TResult Function(UserStateError value) error,
    required TResult Function(UserStateLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailed value)? failed,
    TResult? Function(UserStateError value)? error,
    TResult? Function(UserStateLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailed value)? failed,
    TResult Function(UserStateError value)? error,
    TResult Function(UserStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class UserStateFailed implements UserState {
  factory UserStateFailed(final HttpRequestFailure failure) = _$UserStateFailed;

  HttpRequestFailure get failure;
  @JsonKey(ignore: true)
  _$$UserStateFailedCopyWith<_$UserStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserStateErrorCopyWith<$Res> {
  factory _$$UserStateErrorCopyWith(
          _$UserStateError value, $Res Function(_$UserStateError) then) =
      __$$UserStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> errors});
}

/// @nodoc
class __$$UserStateErrorCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateError>
    implements _$$UserStateErrorCopyWith<$Res> {
  __$$UserStateErrorCopyWithImpl(
      _$UserStateError _value, $Res Function(_$UserStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$UserStateError(
      null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$UserStateError implements UserStateError {
  _$UserStateError(final List<String> errors) : _errors = errors;

  final List<String> _errors;
  @override
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'UserState.error(errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateError &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateErrorCopyWith<_$UserStateError> get copyWith =>
      __$$UserStateErrorCopyWithImpl<_$UserStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(List<Usuario> usuarios) loaded,
  }) {
    return error(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(List<Usuario> usuarios)? loaded,
  }) {
    return error?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(List<Usuario> usuarios)? loaded,
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
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailed value) failed,
    required TResult Function(UserStateError value) error,
    required TResult Function(UserStateLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailed value)? failed,
    TResult? Function(UserStateError value)? error,
    TResult? Function(UserStateLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailed value)? failed,
    TResult Function(UserStateError value)? error,
    TResult Function(UserStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UserStateError implements UserState {
  factory UserStateError(final List<String> errors) = _$UserStateError;

  List<String> get errors;
  @JsonKey(ignore: true)
  _$$UserStateErrorCopyWith<_$UserStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserStateLoadedCopyWith<$Res> {
  factory _$$UserStateLoadedCopyWith(
          _$UserStateLoaded value, $Res Function(_$UserStateLoaded) then) =
      __$$UserStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Usuario> usuarios});
}

/// @nodoc
class __$$UserStateLoadedCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateLoaded>
    implements _$$UserStateLoadedCopyWith<$Res> {
  __$$UserStateLoadedCopyWithImpl(
      _$UserStateLoaded _value, $Res Function(_$UserStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuarios = null,
  }) {
    return _then(_$UserStateLoaded(
      null == usuarios
          ? _value._usuarios
          : usuarios // ignore: cast_nullable_to_non_nullable
              as List<Usuario>,
    ));
  }
}

/// @nodoc

class _$UserStateLoaded implements UserStateLoaded {
  _$UserStateLoaded(final List<Usuario> usuarios) : _usuarios = usuarios;

  final List<Usuario> _usuarios;
  @override
  List<Usuario> get usuarios {
    if (_usuarios is EqualUnmodifiableListView) return _usuarios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usuarios);
  }

  @override
  String toString() {
    return 'UserState.loaded(usuarios: $usuarios)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateLoaded &&
            const DeepCollectionEquality().equals(other._usuarios, _usuarios));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_usuarios));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateLoadedCopyWith<_$UserStateLoaded> get copyWith =>
      __$$UserStateLoadedCopyWithImpl<_$UserStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(HttpRequestFailure failure) failed,
    required TResult Function(List<String> errors) error,
    required TResult Function(List<Usuario> usuarios) loaded,
  }) {
    return loaded(usuarios);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(HttpRequestFailure failure)? failed,
    TResult? Function(List<String> errors)? error,
    TResult? Function(List<Usuario> usuarios)? loaded,
  }) {
    return loaded?.call(usuarios);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(HttpRequestFailure failure)? failed,
    TResult Function(List<String> errors)? error,
    TResult Function(List<Usuario> usuarios)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(usuarios);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailed value) failed,
    required TResult Function(UserStateError value) error,
    required TResult Function(UserStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailed value)? failed,
    TResult? Function(UserStateError value)? error,
    TResult? Function(UserStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailed value)? failed,
    TResult Function(UserStateError value)? error,
    TResult Function(UserStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UserStateLoaded implements UserState {
  factory UserStateLoaded(final List<Usuario> usuarios) = _$UserStateLoaded;

  List<Usuario> get usuarios;
  @JsonKey(ignore: true)
  _$$UserStateLoadedCopyWith<_$UserStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
