import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';

abstract class SignUpService {
  Future<Either<MainFailure, Unit>> signUp({required String email, required String password, String deviceid});
}
