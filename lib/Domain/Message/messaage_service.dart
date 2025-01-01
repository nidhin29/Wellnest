import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Message/message_model.dart';

abstract class MessageService {
  Future<Either<MainFailure,MessageModel>>  getMessages();
}
