import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/SignIn/sign_in_model.dart';
import 'package:wellnest/Domain/SignIn/sign_in_service.dart';
import 'package:wellnest/Domain/TokenManager/token_manager.dart';
import 'package:wellnest/Domain/TokenManager/token_service.dart';

part 'signin_state.dart';
part 'signin_cubit.freezed.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  final SignInService _signInService;
  final TokenService _tokenService;
  SigninCubit(this._signInService, this._tokenService,)
      : super(SigninState.initial());

  signIn(String email, String password,String deviceid) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final response =
        await _signInService.signInWithEmailAndPassword(email, password,deviceid);
    response.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )), (r) async{
      TokenManager.instance.setEmail(r.email!);
     await _tokenService.saveEmail();
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(right(r)),
      ));
    });
  }
}
