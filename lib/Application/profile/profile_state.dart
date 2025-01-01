part of 'profile_cubit.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required Option<Either<MainFailure, Model>> isFailureOrSuccessForGet,
    required Option<Either<MainFailure, Unit>> isFailureOrSuccessForUpdate,
    required Option<Either<MainFailure, Unit>> isFailureOrSuccessForDelete,
    required Model? profileModel,
  }) = _Initial;

  factory ProfileState.initial() => ProfileState(
        isLoading: false,
        isFailureOrSuccessForGet: none(),
        isFailureOrSuccessForUpdate: none(),
        profileModel: null,
        isFailureOrSuccessForDelete: none(),
      );
}
