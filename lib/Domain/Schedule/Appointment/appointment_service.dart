import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';

abstract class AppointmentService {
  Future<Either<MainFailure, Unit>> createAppointment(String date, String time, String doctorEmail);
}
