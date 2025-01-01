import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Home/StartChat/stat_chat_model.dart';

abstract class StartChatServicce {
  Future<Either<MainFailure, StartChatModel>> startChat(String bookid);
}