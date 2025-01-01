

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Application/edit_profile/editprofile_cubit.dart';
import 'package:wellnest/Application/home/home_cubit.dart';
import 'package:wellnest/Application/loggedin/loggedin_cubit.dart';
import 'package:wellnest/Application/message/message_cubit.dart';
import 'package:wellnest/Application/profile/profile_cubit.dart';
import 'package:wellnest/Application/schedule/schedule_cubit.dart';
import 'package:wellnest/Application/signin/signin_cubit.dart';
import 'package:wellnest/Application/signup/signup_cubit.dart';
import 'package:wellnest/Presentation/Splash/splash.dart';
import 'package:wellnest/core/injectable/injectable.dart';
import 'package:wellnest/firebase_options.dart';

void main(List<String> args) async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await configureInjection(Environment.prod);
  runApp(const MyApp());
}


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
    
  );
  print(message.notification!.title.toString());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SigninCubit>(create: (context) => getIt<SigninCubit>()),
        BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
        BlocProvider<SignupCubit>(create: (context) => getIt<SignupCubit>()),
        BlocProvider<LoggedinCubit>(
            create: (context) => getIt<LoggedinCubit>()),
        BlocProvider<ProfileCubit>(create: (context) => getIt<ProfileCubit>()),
        BlocProvider<EditprofileCubit>(
            create: (context) => getIt<EditprofileCubit>()),
        BlocProvider<ScheduleCubit>(
            create: (context) => getIt<ScheduleCubit>()),
        BlocProvider<MessageCubit>(create: (context) => getIt<MessageCubit>())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
