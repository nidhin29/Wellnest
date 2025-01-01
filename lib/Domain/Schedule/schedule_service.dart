import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Schedule/schedule_model.dart';

abstract class ScheduleService {
  Future<Either<MainFailure,ScheduleModel>> getSchedules();
}