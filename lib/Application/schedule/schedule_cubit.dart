import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Schedule/Appointment/appointment_service.dart';
import 'package:wellnest/Domain/Schedule/schedule_model.dart';
import 'package:wellnest/Domain/Schedule/schedule_service.dart';

part 'schedule_state.dart';
part 'schedule_cubit.freezed.dart';

@injectable
class ScheduleCubit extends Cubit<ScheduleState> {
  final ScheduleService scheduleService;
  final AppointmentService appointmentService;
  ScheduleCubit(this.scheduleService, this.appointmentService) : super(ScheduleState.initial());

  getDetails() async {
    emit(state.copyWith(
        isLoading: true, isFailureOrSuccess: none(), scheduleModel: null));
    final response = await scheduleService.getSchedules();
    response.fold(
      (failure) {
        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccess: some(
              left(failure),
            )));
      },
      (scheduleModel) {
        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccess: some(right(scheduleModel)),
            scheduleModel: scheduleModel));
      },
    );
  }

  createAppointment(String date,String time,String doctorEmail) async {
    emit(state.copyWith(
        isLoading: true,
        isAppointmentFailureOrSuccess: none(),
        scheduleModel: null));
    final response = await appointmentService.createAppointment(date, time, doctorEmail);
    response.fold(
      (failure) {
        emit(state.copyWith(
            isLoading: false,
            isAppointmentFailureOrSuccess: some(left(failure))));
      },
      (unit) {
        emit(state.copyWith(
            isLoading: false,
            isAppointmentFailureOrSuccess: some(right(unit))));
      },
    );
  }
}
