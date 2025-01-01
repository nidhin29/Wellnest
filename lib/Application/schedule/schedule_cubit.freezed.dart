// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduleState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, ScheduleModel>> get isFailureOrSuccess =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, Unit>> get isAppointmentFailureOrSuccess =>
      throw _privateConstructorUsedError;
  ScheduleModel? get scheduleModel => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleStateCopyWith<ScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleStateCopyWith<$Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState value, $Res Function(ScheduleState) then) =
      _$ScheduleStateCopyWithImpl<$Res, ScheduleState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, ScheduleModel>> isFailureOrSuccess,
      Option<Either<MainFailure, Unit>> isAppointmentFailureOrSuccess,
      ScheduleModel? scheduleModel});
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res, $Val extends ScheduleState>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
    Object? isAppointmentFailureOrSuccess = null,
    Object? scheduleModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, ScheduleModel>>,
      isAppointmentFailureOrSuccess: null == isAppointmentFailureOrSuccess
          ? _value.isAppointmentFailureOrSuccess
          : isAppointmentFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
      scheduleModel: freezed == scheduleModel
          ? _value.scheduleModel
          : scheduleModel // ignore: cast_nullable_to_non_nullable
              as ScheduleModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, ScheduleModel>> isFailureOrSuccess,
      Option<Either<MainFailure, Unit>> isAppointmentFailureOrSuccess,
      ScheduleModel? scheduleModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
    Object? isAppointmentFailureOrSuccess = null,
    Object? scheduleModel = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, ScheduleModel>>,
      isAppointmentFailureOrSuccess: null == isAppointmentFailureOrSuccess
          ? _value.isAppointmentFailureOrSuccess
          : isAppointmentFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
      scheduleModel: freezed == scheduleModel
          ? _value.scheduleModel
          : scheduleModel // ignore: cast_nullable_to_non_nullable
              as ScheduleModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.isFailureOrSuccess,
      required this.isAppointmentFailureOrSuccess,
      required this.scheduleModel});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, ScheduleModel>> isFailureOrSuccess;
  @override
  final Option<Either<MainFailure, Unit>> isAppointmentFailureOrSuccess;
  @override
  final ScheduleModel? scheduleModel;

  @override
  String toString() {
    return 'ScheduleState(isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess, isAppointmentFailureOrSuccess: $isAppointmentFailureOrSuccess, scheduleModel: $scheduleModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailureOrSuccess, isFailureOrSuccess) ||
                other.isFailureOrSuccess == isFailureOrSuccess) &&
            (identical(other.isAppointmentFailureOrSuccess,
                    isAppointmentFailureOrSuccess) ||
                other.isAppointmentFailureOrSuccess ==
                    isAppointmentFailureOrSuccess) &&
            (identical(other.scheduleModel, scheduleModel) ||
                other.scheduleModel == scheduleModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isFailureOrSuccess,
      isAppointmentFailureOrSuccess, scheduleModel);

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ScheduleState {
  const factory _Initial(
      {required final bool isLoading,
      required final Option<Either<MainFailure, ScheduleModel>>
          isFailureOrSuccess,
      required final Option<Either<MainFailure, Unit>>
          isAppointmentFailureOrSuccess,
      required final ScheduleModel? scheduleModel}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, ScheduleModel>> get isFailureOrSuccess;
  @override
  Option<Either<MainFailure, Unit>> get isAppointmentFailureOrSuccess;
  @override
  ScheduleModel? get scheduleModel;

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
