import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Home/ViewBookings/view_bookings_model.dart';

abstract class ViewBookingsService{
  Future<Either<MainFailure,ViewBookingsModel>> viewBookings();
}