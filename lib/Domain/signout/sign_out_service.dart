import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';

abstract class SignOutService {
  Future<Either<MainFailure,Unit>> signOut(String deviceid);
}