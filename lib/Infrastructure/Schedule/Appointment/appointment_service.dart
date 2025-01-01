import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Schedule/Appointment/appointment_service.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

@LazySingleton(as: AppointmentService)
class AppointmentRepo implements AppointmentService {
  @override
  Future<Either<MainFailure, Unit>> createAppointment(
      String date, String time, String doctorEmail) async {
    try {
      final sha = await SharedPreferences.getInstance();
      final email = sha.getString('email');

      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .post("${baseUrl}api/BookAppoinment", data: {
        "user_email": email,
        "doc_email": doctorEmail,
        "date": date,
        "timeloat": timeLot[time],
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        return Right(unit);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authFailure());
      } else if (e is DioException && e.response?.statusCode == 400) {
        return const Left(MainFailure.incorrectCredential());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }
}

Map<String, String> timeLot = {
  "9:00 AM": "1",
  "10:00 AM": "2",
  "11:00 AM": "3",
  "12:00 PM": "4",
  "13:00 PM": "5",
  "14:00 PM": "6",
  "15:00 PM": "7",
  "16:00 PM": "8",
};
