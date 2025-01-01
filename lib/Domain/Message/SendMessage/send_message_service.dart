import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';

abstract class SendMessageService {
  Future<Either<MainFailure,Unit>> sendMessage(int id,String message);
}