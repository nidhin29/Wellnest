import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Message/SendMessage/send_message_service.dart';
import 'package:wellnest/Domain/Message/ViewMessage/view_message_model.dart';
import 'package:wellnest/Domain/Message/ViewMessage/view_message_service.dart';
import 'package:wellnest/Domain/Message/messaage_service.dart';
import 'package:wellnest/Domain/Message/message_model.dart';
part 'message_state.dart';
part 'message_cubit.freezed.dart';

@injectable
class MessageCubit extends Cubit<MessageState> {
  final MessageService messageService;
  final ViewMessageService viewMessageService;
  final SendMessageService sendMessageService;
  MessageCubit(this.messageService, this.viewMessageService, this.sendMessageService) : super(MessageState.initial());

  getMessages() async {
    emit(state.copyWith(
        isLoading: true, isFailureOrSuccess: none(), messageModel: null));
    final response = await messageService.getMessages();
    response.fold(
      (failure) {
        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccess: some(
              left(failure),
            )));
      },
      (messageModel) {
        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccess: some(right(messageModel)),
            messageModel: messageModel));
      },
    );
  }

  viewMessages(int id) async {
    emit(state.copyWith(
        isLoading: true,
        isFailureOrSuccessForViewMessage: none(),
       ));
    final response = await viewMessageService.getViewMessages(id);
    response.fold(
      (failure) {
        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccessForViewMessage: some(
              left(failure),
            )));
      },
      (chats) {
      
        final newMessages = chats.chats!.where((message) {
          return message.id != null && !state.displayedMessageIds.contains(message.id);
        }).toList();

      
        final updatedMessageIds = {
          ...state.displayedMessageIds,
          ...newMessages.map((message) => message.id!).whereType<int>()
        };

        
        final updatedMessages = [
          ...?state.chats,
          ...newMessages
        ];

        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccessForViewMessage: some(right(updatedMessages)),
            chats: updatedMessages,
            displayedMessageIds: updatedMessageIds, 
           ));
      },
    );
  }


  sendMessage(int id,String message) async {
    emit(state.copyWith(
        isLoading: true, isFailureOrSuccessForSendMessage: none()));
    final response = await sendMessageService.sendMessage(id,message);
    response.fold(
      (failure) {
        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccessForSendMessage: some(left(failure))));
      },
      (unit) {
        emit(state.copyWith(
            isLoading: false,
            isFailureOrSuccessForSendMessage: some(right(unit))));
      },
    );
  }
}
