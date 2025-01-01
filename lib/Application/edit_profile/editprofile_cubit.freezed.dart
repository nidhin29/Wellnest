// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editprofile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditprofileState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, Unit>> get isFailureOrSuccessForUpdate =>
      throw _privateConstructorUsedError;

  /// Create a copy of EditprofileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditprofileStateCopyWith<EditprofileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditprofileStateCopyWith<$Res> {
  factory $EditprofileStateCopyWith(
          EditprofileState value, $Res Function(EditprofileState) then) =
      _$EditprofileStateCopyWithImpl<$Res, EditprofileState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, Unit>> isFailureOrSuccessForUpdate});
}

/// @nodoc
class _$EditprofileStateCopyWithImpl<$Res, $Val extends EditprofileState>
    implements $EditprofileStateCopyWith<$Res> {
  _$EditprofileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditprofileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccessForUpdate = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccessForUpdate: null == isFailureOrSuccessForUpdate
          ? _value.isFailureOrSuccessForUpdate
          : isFailureOrSuccessForUpdate // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $EditprofileStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, Unit>> isFailureOrSuccessForUpdate});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$EditprofileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditprofileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccessForUpdate = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccessForUpdate: null == isFailureOrSuccessForUpdate
          ? _value.isFailureOrSuccessForUpdate
          : isFailureOrSuccessForUpdate // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading, required this.isFailureOrSuccessForUpdate});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, Unit>> isFailureOrSuccessForUpdate;

  @override
  String toString() {
    return 'EditprofileState(isLoading: $isLoading, isFailureOrSuccessForUpdate: $isFailureOrSuccessForUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailureOrSuccessForUpdate,
                    isFailureOrSuccessForUpdate) ||
                other.isFailureOrSuccessForUpdate ==
                    isFailureOrSuccessForUpdate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isFailureOrSuccessForUpdate);

  /// Create a copy of EditprofileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements EditprofileState {
  const factory _Initial(
      {required final bool isLoading,
      required final Option<Either<MainFailure, Unit>>
          isFailureOrSuccessForUpdate}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, Unit>> get isFailureOrSuccessForUpdate;

  /// Create a copy of EditprofileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
