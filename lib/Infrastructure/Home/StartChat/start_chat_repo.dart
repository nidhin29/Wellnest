import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Home/StartChat/start_chat_servicce.dart';
import 'package:wellnest/Domain/Home/StartChat/stat_chat_model.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

@LazySingleton(as: StartChatServicce)
class StartChatRepo implements StartChatServicce{
  @override
  Future<Either<MainFailure, StartChatModel>> startChat(String bookid) async{
    try {
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .get("${baseUrl}api/StartChat", data: {
        "bookid": bookid,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final startChatModel = StartChatModel.fromJson(response.data);
        return Right(startChatModel);
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