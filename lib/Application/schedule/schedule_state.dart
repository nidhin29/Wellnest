part of 'schedule_cubit.dart';

@freezed
abstract class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    required bool isLoading,
    required Option<Either<MainFailure,ScheduleModel>> isFailureOrSuccess,
    required Option<Either<MainFailure,Unit>>  isAppointmentFailureOrSuccess,
    required ScheduleModel? scheduleModel,
  }) = _Initial;

  factory ScheduleState.initial() => ScheduleState(
        isLoading: false,
        isFailureOrSuccess: none(),
        scheduleModel: null, isAppointmentFailureOrSuccess: none(),
      );
}
