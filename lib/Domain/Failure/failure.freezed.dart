// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
    required TResult Function() authFailure,
    required TResult Function() incorrectCredential,
    required TResult Function() otherFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
    TResult? Function()? authFailure,
    TResult? Function()? incorrectCredential,
    TResult? Function()? otherFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    TResult Function()? authFailure,
    TResult Function()? incorrectCredential,
    TResult Function()? otherFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(IncorrectCredential value) incorrectCredential,
    required TResult Function(otherFailure value) otherFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(IncorrectCredential value)? incorrectCredential,
    TResult? Function(otherFailure value)? otherFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(IncorrectCredential value)? incorrectCredential,
    TResult Function(otherFailure value)? otherFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainFailureCopyWith<$Res> {
  factory $MainFailureCopyWith(
          MainFailure value, $Res Function(MainFailure) then) =
      _$MainFailureCopyWithImpl<$Res, MainFailure>;
}

/// @nodoc
class _$MainFailureCopyWithImpl<$Res, $Val extends MainFailure>
    implements $MainFailureCopyWith<$Res> {
  _$MainFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ClientFailureImplCopyWith<$Res> {
  factory _$$ClientFailureImplCopyWith(
          _$ClientFailureImpl value, $Res Function(_$ClientFailureImpl) then) =
      __$$ClientFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClientFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$ClientFailureImpl>
    implements _$$ClientFailureImplCopyWith<$Res> {
  __$$ClientFailureImplCopyWithImpl(
      _$ClientFailureImpl _value, $Res Function(_$ClientFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClientFailureImpl implements _ClientFailure {
  const _$ClientFailureImpl();

  @override
  String toString() {
    return 'MainFailure.clientFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClientFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
    required TResult Function() authFailure,
    required TResult Function() incorrectCredential,
    required TResult Function() otherFailure,
  }) {
    return clientFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
    TResult? Function()? authFailure,
    TResult? Function()? incorrectCredential,
    TResult? Function()? otherFailure,
  }) {
    return clientFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    TResult Function()? authFailure,
    TResult Function()? incorrectCredential,
    TResult Function()? otherFailure,
    required TResult orElse(),
  }) {
    if (clientFailure != null) {
      return clientFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(IncorrectCredential value) incorrectCredential,
    required TResult Function(otherFailure value) otherFailure,
  }) {
    return clientFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(IncorrectCredential value)? incorrectCredential,
    TResult? Function(otherFailure value)? otherFailure,
  }) {
    return clientFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(IncorrectCredential value)? incorrectCredential,
    TResult Function(otherFailure value)? otherFailure,
    required TResult orElse(),
  }) {
    if (clientFailure != null) {
      return clientFailure(this);
    }
    return orElse();
  }
}

abstract class _ClientFailure implements MainFailure {
  const factory _ClientFailure() = _$ClientFailureImpl;
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ServerFailureImpl implements _ServerFailure {
  const _$ServerFailureImpl();

  @override
  String toString() {
    return 'MainFailure.serverFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
    required TResult Function() authFailure,
    required TResult Function() incorrectCredential,
    required TResult Function() otherFailure,
  }) {
    return serverFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
    TResult? Function()? authFailure,
    TResult? Function()? incorrectCredential,
    TResult? Function()? otherFailure,
  }) {
    return serverFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    TResult Function()? authFailure,
    TResult Function()? incorrectCredential,
    TResult Function()? otherFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(IncorrectCredential value) incorrectCredential,
    required TResult Function(otherFailure value) otherFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(IncorrectCredential value)? incorrectCredential,
    TResult? Function(otherFailure value)? otherFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(IncorrectCredential value)? incorrectCredential,
    TResult Function(otherFailure value)? otherFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class _ServerFailure implements MainFailure {
  const factory _ServerFailure() = _$ServerFailureImpl;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
          _$AuthFailureImpl value, $Res Function(_$AuthFailureImpl) then) =
      __$$AuthFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl _value, $Res Function(_$AuthFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthFailureImpl implements AuthFailure {
  const _$AuthFailureImpl();

  @override
  String toString() {
    return 'MainFailure.authFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
    required TResult Function() authFailure,
    required TResult Function() incorrectCredential,
    required TResult Function() otherFailure,
  }) {
    return authFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
    TResult? Function()? authFailure,
    TResult? Function()? incorrectCredential,
    TResult? Function()? otherFailure,
  }) {
    return authFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    TResult Function()? authFailure,
    TResult Function()? incorrectCredential,
    TResult Function()? otherFailure,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(IncorrectCredential value) incorrectCredential,
    required TResult Function(otherFailure value) otherFailure,
  }) {
    return authFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(IncorrectCredential value)? incorrectCredential,
    TResult? Function(otherFailure value)? otherFailure,
  }) {
    return authFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(IncorrectCredential value)? incorrectCredential,
    TResult Function(otherFailure value)? otherFailure,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(this);
    }
    return orElse();
  }
}

abstract class AuthFailure implements MainFailure {
  const factory AuthFailure() = _$AuthFailureImpl;
}

/// @nodoc
abstract class _$$IncorrectCredentialImplCopyWith<$Res> {
  factory _$$IncorrectCredentialImplCopyWith(_$IncorrectCredentialImpl value,
          $Res Function(_$IncorrectCredentialImpl) then) =
      __$$IncorrectCredentialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IncorrectCredentialImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$IncorrectCredentialImpl>
    implements _$$IncorrectCredentialImplCopyWith<$Res> {
  __$$IncorrectCredentialImplCopyWithImpl(_$IncorrectCredentialImpl _value,
      $Res Function(_$IncorrectCredentialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IncorrectCredentialImpl implements IncorrectCredential {
  const _$IncorrectCredentialImpl();

  @override
  String toString() {
    return 'MainFailure.incorrectCredential()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncorrectCredentialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
    required TResult Function() authFailure,
    required TResult Function() incorrectCredential,
    required TResult Function() otherFailure,
  }) {
    return incorrectCredential();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
    TResult? Function()? authFailure,
    TResult? Function()? incorrectCredential,
    TResult? Function()? otherFailure,
  }) {
    return incorrectCredential?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    TResult Function()? authFailure,
    TResult Function()? incorrectCredential,
    TResult Function()? otherFailure,
    required TResult orElse(),
  }) {
    if (incorrectCredential != null) {
      return incorrectCredential();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(IncorrectCredential value) incorrectCredential,
    required TResult Function(otherFailure value) otherFailure,
  }) {
    return incorrectCredential(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(IncorrectCredential value)? incorrectCredential,
    TResult? Function(otherFailure value)? otherFailure,
  }) {
    return incorrectCredential?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(IncorrectCredential value)? incorrectCredential,
    TResult Function(otherFailure value)? otherFailure,
    required TResult orElse(),
  }) {
    if (incorrectCredential != null) {
      return incorrectCredential(this);
    }
    return orElse();
  }
}

abstract class IncorrectCredential implements MainFailure {
  const factory IncorrectCredential() = _$IncorrectCredentialImpl;
}

/// @nodoc
abstract class _$$otherFailureImplCopyWith<$Res> {
  factory _$$otherFailureImplCopyWith(
          _$otherFailureImpl value, $Res Function(_$otherFailureImpl) then) =
      __$$otherFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$otherFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$otherFailureImpl>
    implements _$$otherFailureImplCopyWith<$Res> {
  __$$otherFailureImplCopyWithImpl(
      _$otherFailureImpl _value, $Res Function(_$otherFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$otherFailureImpl implements otherFailure {
  const _$otherFailureImpl();

  @override
  String toString() {
    return 'MainFailure.otherFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$otherFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
    required TResult Function() authFailure,
    required TResult Function() incorrectCredential,
    required TResult Function() otherFailure,
  }) {
    return otherFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
    TResult? Function()? authFailure,
    TResult? Function()? incorrectCredential,
    TResult? Function()? otherFailure,
  }) {
    return otherFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    TResult Function()? authFailure,
    TResult Function()? incorrectCredential,
    TResult Function()? otherFailure,
    required TResult orElse(),
  }) {
    if (otherFailure != null) {
      return otherFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(IncorrectCredential value) incorrectCredential,
    required TResult Function(otherFailure value) otherFailure,
  }) {
    return otherFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(IncorrectCredential value)? incorrectCredential,
    TResult? Function(otherFailure value)? otherFailure,
  }) {
    return otherFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(IncorrectCredential value)? incorrectCredential,
    TResult Function(otherFailure value)? otherFailure,
    required TResult orElse(),
  }) {
    if (otherFailure != null) {
      return otherFailure(this);
    }
    return orElse();
  }
}

abstract class otherFailure implements MainFailure {
  const factory otherFailure() = _$otherFailureImpl;
}
