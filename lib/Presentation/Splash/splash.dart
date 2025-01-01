import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Application/loggedin/loggedin_cubit.dart';
import 'package:wellnest/Application/profile/profile_cubit.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Presentation/Auth/fill_profile.dart';
import 'package:wellnest/Presentation/Home/mainscreen.dart';
import 'package:wellnest/Presentation/Splash/intro.dart';
import 'package:wellnest/Presentation/Splash/notification.dart';
import 'package:wellnest/Presentation/common%20widgets/snackbar.dart';
import 'package:wellnest/Presentation/constants/constants.dart';
import 'package:wellnest/Presentation/constants/loading.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    
      NotificationHandle().requestNotificationPermission();
     
      BlocProvider.of<LoggedinCubit>(context).isLoggedIn();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.isFailureOrSuccessForGet.fold(
            () {},
            (either) => either.fold(
              (failure) {
                if (!state.isLoading) {
                  if (failure == const MainFailure.serverFailure()) {
                    displaySnackBar(context: context, text: "Server is down");
                  } else if (failure == const MainFailure.clientFailure()) {
                    displaySnackBar(
                        context: context,
                        text: "Something wrong with your network");
                  } else {
                    displaySnackBar(
                        context: context,
                        text: "Something Unexpected Happened");
                  }
                }
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const IntroPage()));
              },
              (r) {
                r.profileUpdated == 0
                    ? Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => FillProfilePage(),
                        ),
                        (route) => false)
                    : Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const MainScreenPage(),
                        ),
                        (route) => false);
              },
            ),
          );
        },
        child: BlocListener<LoggedinCubit, LoggedinState>(
          listener: (context, state) {
            if (state.value) {
              BlocProvider.of<ProfileCubit>(context).getProfile();
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const IntroPage()));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              kheight50,
              kheight20,
              Text('E-MOGRAM',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ))),
              kheight20,
              spinkit,
            ],
          ),
        ),
      ),
    );
  }
}
