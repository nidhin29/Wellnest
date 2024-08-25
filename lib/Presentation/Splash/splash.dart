import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Application/loggedin/loggedin_cubit.dart';
import 'package:wellnest/Presentation/Home/mainscreen.dart';
import 'package:wellnest/Presentation/Splash/intro.dart';
import 'package:wellnest/Presentation/constants/constants.dart';
import 'package:wellnest/Presentation/constants/loading.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<LoggedinCubit>(context).isLoggedIn();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoggedinCubit, LoggedinState>(
        listener: (context, state) {
          state.value
              ? Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MainScreenPage()))
              : Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const IntroPage()));
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
    );
  }
}
