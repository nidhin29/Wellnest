// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:wellnest/Application/edit_profile/editprofile_cubit.dart'
    as _i317;
import 'package:wellnest/Application/home/home_cubit.dart' as _i914;
import 'package:wellnest/Application/loggedin/loggedin_cubit.dart' as _i802;
import 'package:wellnest/Application/message/message_cubit.dart' as _i593;
import 'package:wellnest/Application/profile/profile_cubit.dart' as _i890;
import 'package:wellnest/Application/schedule/schedule_cubit.dart' as _i436;
import 'package:wellnest/Application/signin/signin_cubit.dart' as _i623;
import 'package:wellnest/Application/signup/signup_cubit.dart' as _i340;
import 'package:wellnest/Domain/Home/home_service.dart' as _i697;
import 'package:wellnest/Domain/Home/StartChat/start_chat_servicce.dart'
    as _i510;
import 'package:wellnest/Domain/Home/ViewBookings/view_bookings_service.dart'
    as _i195;
import 'package:wellnest/Domain/LoggedIn/logged_in_service.dart' as _i713;
import 'package:wellnest/Domain/Message/messaage_service.dart' as _i1021;
import 'package:wellnest/Domain/Message/SendMessage/send_message_service.dart'
    as _i823;
import 'package:wellnest/Domain/Message/ViewMessage/view_message_service.dart'
    as _i542;
import 'package:wellnest/Domain/Profile/profile_service.dart' as _i606;
import 'package:wellnest/Domain/Schedule/Appointment/appointment_service.dart'
    as _i696;
import 'package:wellnest/Domain/Schedule/schedule_service.dart' as _i701;
import 'package:wellnest/Domain/SignIn/sign_in_service.dart' as _i949;
import 'package:wellnest/Domain/signout/sign_out_service.dart' as _i783;
import 'package:wellnest/Domain/SignUp/signup_service.dart' as _i244;
import 'package:wellnest/Domain/TokenManager/token_service.dart' as _i20;
import 'package:wellnest/Infrastructure/Home/home_repo.dart' as _i171;
import 'package:wellnest/Infrastructure/Home/StartChat/start_chat_repo.dart'
    as _i305;
import 'package:wellnest/Infrastructure/Home/ViewBookings/view_bookings_repo.dart'
    as _i1017;
import 'package:wellnest/Infrastructure/LoggedIn/logged_in_repo.dart' as _i122;
import 'package:wellnest/Infrastructure/Message/message_repo.dart' as _i380;
import 'package:wellnest/Infrastructure/Message/SendMessage/send_message_repo.dart'
    as _i710;
import 'package:wellnest/Infrastructure/Message/ViewMessage/view_message_repo.dart'
    as _i1032;
import 'package:wellnest/Infrastructure/Profile/profile_repo.dart' as _i437;
import 'package:wellnest/Infrastructure/Schedule/Appointment/appointment_service.dart'
    as _i312;
import 'package:wellnest/Infrastructure/Schedule/schedule_repo.dart' as _i697;
import 'package:wellnest/Infrastructure/SignIn/sign_in_repo.dart' as _i193;
import 'package:wellnest/Infrastructure/signout/signout.dart' as _i503;
import 'package:wellnest/Infrastructure/SignUp/signup_repo.dart' as _i288;
import 'package:wellnest/Infrastructure/TokenManager/token_repo.dart' as _i222;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i701.ScheduleService>(() => _i697.ScheduleRepo());
    gh.lazySingleton<_i783.SignOutService>(() => _i503.SignoutRepo());
    gh.lazySingleton<_i696.AppointmentService>(() => _i312.AppointmentRepo());
    gh.lazySingleton<_i697.HomeService>(() => _i171.HomeRepo());
    gh.lazySingleton<_i20.TokenService>(() => _i222.TokenRepo());
    gh.lazySingleton<_i195.ViewBookingsService>(
        () => _i1017.ViewBookingsRepo());
    gh.lazySingleton<_i542.ViewMessageService>(
        () => _i1032.ViewMessageServiceRepo());
    gh.lazySingleton<_i510.StartChatServicce>(() => _i305.StartChatRepo());
    gh.lazySingleton<_i949.SignInService>(() => _i193.SignInRepo());
    gh.lazySingleton<_i823.SendMessageService>(() => _i710.SendMessageRepo());
    gh.lazySingleton<_i606.ProfileService>(() => _i437.ProfileRepo());
    gh.lazySingleton<_i713.LoggedInService>(() => _i122.LoggedInRepo());
    gh.lazySingleton<_i1021.MessageService>(() => _i380.MessageRepo());
    gh.factory<_i802.LoggedinCubit>(
        () => _i802.LoggedinCubit(gh<_i713.LoggedInService>()));
    gh.lazySingleton<_i244.SignUpService>(() => _i288.SignUpRepo());
    gh.factory<_i623.SigninCubit>(() => _i623.SigninCubit(
          gh<_i949.SignInService>(),
          gh<_i20.TokenService>(),
        ));
    gh.factory<_i340.SignupCubit>(() => _i340.SignupCubit(
          gh<_i244.SignUpService>(),
          gh<_i20.TokenService>(),
        ));
    gh.factory<_i317.EditprofileCubit>(
        () => _i317.EditprofileCubit(gh<_i606.ProfileService>()));
    gh.factory<_i436.ScheduleCubit>(() => _i436.ScheduleCubit(
          gh<_i701.ScheduleService>(),
          gh<_i696.AppointmentService>(),
        ));
    gh.factory<_i890.ProfileCubit>(() => _i890.ProfileCubit(
          gh<_i606.ProfileService>(),
          gh<_i20.TokenService>(),
          gh<_i783.SignOutService>(),
        ));
    gh.factory<_i593.MessageCubit>(() => _i593.MessageCubit(
          gh<_i1021.MessageService>(),
          gh<_i542.ViewMessageService>(),
          gh<_i823.SendMessageService>(),
        ));
    gh.factory<_i914.HomeCubit>(() => _i914.HomeCubit(
          gh<_i697.HomeService>(),
          gh<_i195.ViewBookingsService>(),
          gh<_i510.StartChatServicce>(),
        ));
    return this;
  }
}
