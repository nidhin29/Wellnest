import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wellnest/Application/home/home_cubit.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Presentation/Messages/chat.dart';
import 'package:wellnest/Presentation/Messages/messages.dart';
import 'package:wellnest/Presentation/Splash/notification.dart';
import 'package:wellnest/Presentation/common%20widgets/snackbar.dart';
import 'package:wellnest/Presentation/common%20widgets/tips_widget.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
       NotificationHandle().getDeviceToken().then((value) {
        print(value);
      });
       NotificationHandle().firebaseInit(context);
       NotificationHandle().setupInteractMessage(context);
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final bloc = BlocProvider.of<HomeCubit>(context).state;
      bloc.isFailureOrSuccess.fold(
        () {
          BlocProvider.of<HomeCubit>(context).getDetails();
        },
        (either) => either.fold(
          (failure) {
            BlocProvider.of<HomeCubit>(context).getDetails();
          },
          (r) {},
        ),
      );
      bloc.isFailureOrSuccessViewBookings.fold(
        () {
          BlocProvider.of<HomeCubit>(context).viewBookings();
        },
        (either) => either.fold(
          (failure) {
            BlocProvider.of<HomeCubit>(context).viewBookings();
          },
          (r) {},
        ),
      );
    });

    final size = MediaQuery.of(context).size.width;
    String getGreeting() {
      final hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning';
      } else if (hour > 12 && hour < 17) {
        return 'Good Afternoon';
      } else {
        return 'Good Evening';
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size * 0.2),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: maincolor,
            titleSpacing: size * 0.09,
            title: Padding(
              padding: EdgeInsets.only(top: size * 0.005),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${getGreeting()}👋',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: size * 0.042,
                        fontWeight: FontWeight.w400,
                      ))),
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      state.isFailureOrSuccess.fold(
                        () {},
                        (either) => either.fold(
                          (failure) {
                            if (!state.isLoading) {
                              if (failure ==
                                  const MainFailure.serverFailure()) {
                                displaySnackBar(
                                    context: context, text: "Server is down");
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
                          (r) {},
                        ),
                      );

                      state.isFailureOrSuccessViewBookings.fold(
                        () {},
                        (either) => either.fold(
                          (failure) {
                            if (!state.isLoadingViewBookings) {
                              if (failure ==
                                  const MainFailure.serverFailure()) {
                                displaySnackBar(
                                    context: context, text: "Server is down");
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
                          (r) {},
                        ),
                      );

                      state.isFailureOrSuccessStartChat.fold(() {}, (either) {
                        either.fold((l) {}, (r) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChatPage(
                                    id: r.room!,
                                    name: r.doctorName!,
                                  )));
                        });
                      });
                    },
                    builder: (context, state) {
                      if (state.isLoading) {
                        return Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 0, 0, 0),
                          highlightColor:
                              const Color.fromARGB(255, 207, 207, 207),
                          child: Container(
                            width: size * 0.45,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(34, 0, 0, 0),
                            ),
                          ),
                        );
                      }
                      return state.homeModel == null
                          ? const SizedBox()
                          : Text(state.homeModel!.name!,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: size * 0.044,
                                fontWeight: FontWeight.w600,
                              )));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size * 0.09),
          child: Column(
            children: [
              Text('Upcoming Appointments',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ))),
              kheight20,
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  state.isFailureOrSuccessViewBookings.fold(
                    () {},
                    (either) => either.fold(
                      (failure) {
                        if (!state.isLoading) {
                          if (failure == const MainFailure.serverFailure()) {
                            displaySnackBar(
                                context: context, text: "Server is down");
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
                      (r) {},
                    ),
                  );
                },
                builder: (context, state) {
                  if (state.isLoadingViewBookings) {
                    return SizedBox(
                      height: size * 0.4,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => kwidth10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 0, 0, 0),
                            highlightColor:
                                const Color.fromARGB(255, 207, 207, 207),
                            child: Container(
                              width: (size - 12) * 0.8,
                              height: (size - 12) * 0.4,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(34, 0, 0, 0),
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          );
                        },
                        itemCount: 5,
                      ),
                    );
                  }

                  return state.isFailureOrSuccessViewBookings.fold(
                    () {
                      return Center(
                        child: Text(
                          'No Upcoming Appointments',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    (either) => either.fold(
                      (failure) {
                        return Center(
                          child: Text(
                            'No Upcoming Appointments',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      (r) {
                        return r.bookings!.isEmpty || r.bookings == null
                            ? Center(
                                child: Text(
                                  'No Upcoming Appointments',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : SizedBox(
                                height: size * 0.4,
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      DateTime dateTime = DateTime.parse(
                                          r.bookings![index].datetime!);
                                      DateTime time = DateTime.parse(
                                          r.bookings![index].bookdate!);
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd').format(time);
                                      String formattedTime =
                                          DateFormat('hh:mm a')
                                              .format(dateTime);
                                      return GestureDetector(
                                        onTap: () {
                                          DateTime now = DateTime.now();
                                          String currentDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(now);
                                          String currentTime =
                                              DateFormat('hh:mm a').format(now);
                                          if (currentDate == formattedDate &&
                                              currentTime == formattedTime) {
                                            BlocProvider.of<HomeCubit>(context)
                                                .startChat(r.bookings![index].id
                                                    .toString());
                                          } else {
                                            displaySnackBar(
                                                context: context,
                                                text:
                                                    "You can only chat with the doctor at the time of appointment");
                                          }
                                        },
                                        child: AppointmentTileWidget(
                                            size: size - 12,
                                            name:
                                                r.bookings![index].doctorName!,
                                            date: formattedDate,
                                            time: formattedTime),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return kwidth10;
                                    },
                                    itemCount: r.bookings!.length),
                              );
                      },
                    ),
                  );
                },
              ),
              kheight50,
              Text('Health Tips',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ))),
              kheight20,
              TipsWidget(
                  color: Colors.redAccent,
                  size: size,
                  heading: 'Stay Hydrated',
                  description:
                      'Drink at least 8 glasses of water a day to keep your body hydrated and maintain energy levels'),
              kheight20,
              TipsWidget(
                  size: size,
                  heading: 'Balanced Diet',
                  description:
                      'Incorporate a variety of fruits, vegetables, lean proteins, and whole grains into your diet for optimal nutrition',
                  color: Colors.blueAccent),
              kheight20,
              TipsWidget(
                  size: size,
                  heading: 'Regular Exercise',
                  description:
                      'Aim for at least 30 minutes of moderate exercise, like walking or cycling, most days of the week to improve cardiovascular health',
                  color: Colors.greenAccent),
              kheight20,
              TipsWidget(
                  size: size,
                  heading: 'Proper Sleep',
                  description:
                      'Ensure you get 7-9 hours of quality sleep each night to help your body recover and function effectively',
                  color: Colors.pinkAccent),
              kheight20,
              TipsWidget(
                  size: size,
                  heading: 'Stretching',
                  description:
                      'Start your day with a few minutes of stretching to improve flexibility, reduce muscle tension, and prevent injury',
                  color: Colors.brown),
              kheight20,
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentTileWidget extends StatelessWidget {
  const AppointmentTileWidget({
    super.key,
    required this.size,
    required this.name,
    required this.date,
    required this.time,
  });

  final double size;
  final String name;

  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.8,
      height: size * 0.4,
      decoration: BoxDecoration(
        color: maincolor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: size * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  width: size * 0.13,
                  height: size * 0.13,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      getName(name),
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: maincolor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ))),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: size * 0.7,
              height: size * 0.12,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 209, 205, 205)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.calendar_month),
                  Text(
                    date,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                  const Icon(Icons.access_time),
                  Text(
                    time,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
