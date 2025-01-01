import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/SignUp/signup_service.dart';
import 'package:wellnest/Domain/TokenManager/token_manager.dart';
import 'package:wellnest/Domain/TokenManager/token_service.dart';
part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignUpService _signUpService;
  final TokenService tokenService;
  SignupCubit(this._signUpService, this.tokenService)
      : super(SignupState.initial());

  signUp({required String email, required String password,required String deviceid}) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final Either<MainFailure, Unit> response =
        await _signUpService.signUp(email: email, password: password,deviceid: deviceid);
    response.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )), (r) async{
     
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(right(r)),
      ));
    });
  }

  saveEmail({required String email}) {
    TokenManager.instance.setEmail(email);
    tokenService.saveEmail();
  }
}
