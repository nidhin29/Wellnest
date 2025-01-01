import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Message/ViewMessage/view_message_model.dart';

abstract class ViewMessageService {
  Future<Either<MainFailure, ViewMessageModel>> getViewMessages(int id);
}
