import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Application/profile/profile_cubit.dart';
import 'package:wellnest/Application/signin/signin_cubit.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Presentation/Auth/fill_profile.dart';
import 'package:wellnest/Presentation/Auth/signup.dart';
import 'package:wellnest/Presentation/Home/mainscreen.dart';
import 'package:wellnest/Presentation/Splash/notification.dart';
import 'package:wellnest/Presentation/common%20widgets/snackbar.dart';
import 'package:wellnest/Presentation/constants/constants.dart';
import 'package:wellnest/Presentation/constants/loading.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final ValueNotifier<bool> obtext = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    String deviceid = '';
    final size = MediaQuery.of(context).size.width;
    void passwordfunction() {
      obtext.value = !obtext.value;
    }

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
              },
              (r) {
                r.profileUpdated == 0
                    ? Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FillProfilePage(),
                        ),
                      )
                    : Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const MainScreenPage(),
                        ),
                        (route) => false);
              },
            ),
          );
        },
        child: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            state.isFailureOrSuccess.fold(
                () => null,
                (either) => either.fold(
                      (failure) {
                        if (!state.isLoading) {
                          if (failure == const MainFailure.serverFailure()) {
                            displaySnackBar(
                                context: context, text: "Server is down");
                          } else if (failure ==
                              const MainFailure.authFailure()) {
                            displaySnackBar(
                                context: context,
                                text: "Please check the email address");
                          } else if (failure ==
                              const MainFailure.incorrectCredential()) {
                            displaySnackBar(
                                context: context, text: "Incorrect Password");
                          } else if (failure ==
                              const MainFailure.clientFailure()) {
                            displaySnackBar(
                                context: context,
                                text: "Something wrong with your network");
                          } else {
                            displaySnackBar(
                                context: context,
                                text: "Something Unexpected Happened");
                          }
                        }
                      },
                      (r) {
                        BlocProvider.of<ProfileCubit>(context).getProfile();
                      },
                    ));
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: spinkit,
              );
            }
            return Column(
              children: [
                kheight5,
                kheight10,
                Container(
                  width: double.infinity,
                  height: size * 0.8,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/imgs/login.png'),
                          fit: BoxFit.cover)),
                ),
                Text('Login to Your Account',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: size * 0.07,
                      fontWeight: FontWeight.w600,
                    ))),
                kheight5,
                kheight10,
                kheight5,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 183, 179, 179),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      prefixIcon: const Icon(Icons.email,
                          color: Color.fromRGBO(69, 69, 69, 1)),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(69, 69, 69, 1),
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                kheight5,
                kheight10,
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ValueListenableBuilder(
                      valueListenable: obtext,
                      builder: (context, value, child) {
                        return TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            } else if (!value.contains(RegExp(r'[0-9]'))) {
                              return 'Password must contain a number';
                            }
                            //  else if (!value
                            //     .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                            //   return 'Password must contain a special character';
                            // }
                            return null;
                          },
                          obscureText: !value,
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 183, 179, 179),
                            suffixIcon: IconButton(
                              onPressed: () {
                                passwordfunction();
                              },
                              icon: Icon(value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size * 0.04)),
                            ),
                            prefixIcon: const Icon(Icons.lock,
                                color: Color.fromRGBO(69, 69, 69, 1)),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(69, 69, 69, 1),
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    )),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (emailcontroller.text.isEmpty ||
                        passwordcontroller.text.isEmpty) {
                      displaySnackBar(
                          context: context, text: "Please fill all the fields");
                    } else {
                      NotificationHandle().getDeviceToken().then((value) {
                        deviceid = value;
                      });
                      print(deviceid);
                      BlocProvider.of<SigninCubit>(context).signIn(
                          emailcontroller.text,
                          passwordcontroller.text,
                          deviceid);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(maincolor),
                    minimumSize:
                        WidgetStateProperty.all(Size(size * 0.8, size * 0.15)),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                kheight5,
                Padding(
                  padding: EdgeInsets.only(left: size * 0.18),
                  child: Row(
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: maincolor),
                          )),
                    ],
                  ),
                ),
                kheight10,
                kheight10,
              ],
            );
          },
        ),
      ),
    );
  }
}
