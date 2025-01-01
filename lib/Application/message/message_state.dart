part of 'message_cubit.dart';

@freezed
abstract class MessageState with _$MessageState {
  const factory MessageState({
    required bool isLoading,
    required Option<Either<MainFailure,List<ChatsView>>> isFailureOrSuccessForViewMessage,
    required Option<Either<MainFailure,Unit>> isFailureOrSuccessForSendMessage,
    required Option<Either<MainFailure,MessageModel>> isFailureOrSuccess,
    required MessageModel? messageModel,
    required List<ChatsView>? chats,
    required Set<int> displayedMessageIds,
  }) = _Initial;

   factory MessageState.initial() => MessageState(
        isLoading: false,
        chats: [],
        isFailureOrSuccessForViewMessage: none(),
        isFailureOrSuccessForSendMessage: none(),
        isFailureOrSuccess: none(),
        messageModel: null,
        displayedMessageIds: {},
       
      );
}
