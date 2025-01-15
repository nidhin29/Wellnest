import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wellnest/Application/schedule/schedule_cubit.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Presentation/Appointments/doctor_details_page.dart';
import 'package:wellnest/Presentation/common%20widgets/doctor_tile_widget.dart';
import 'package:wellnest/Presentation/common%20widgets/snackbar.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final bloc = BlocProvider.of<ScheduleCubit>(context).state;
      bloc.isFailureOrSuccess.fold(() {
        BlocProvider.of<ScheduleCubit>(context).getDetails();
      }, (either) {
        either.fold((l) {
          BlocProvider.of<ScheduleCubit>(context).getDetails();
        }, (r) {});
      });
    });
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Schedule',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Available Doctors',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ))),
            BlocConsumer<ScheduleCubit, ScheduleState>(
              listener: (context, state) {
                state.isFailureOrSuccess.fold(
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
                if (state.isLoading) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => kheight20,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(size * 0.06),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 0, 0, 0),
                          highlightColor:
                              const Color.fromARGB(255, 207, 207, 207),
                          child: Container(
                            height: size * 0.55,
                            width: size * 0.9,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(34, 0, 0, 0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ));
                    },
                  );
                }

                return state.isFailureOrSuccess.fold(
                  () {
                    return Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(
                        child: Text(
                          'No Available Doctors',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  (either) => either.fold(
                    (failure) {
                      return Center(
                        child: Text(
                          'No Available Doctors',
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
                      print(r.doctors![0].experence);
                      return r.doctors!.isEmpty || r.doctors == null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 150),
                              child: Center(
                                child: Text(
                                  'No Available Doctors',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) => kheight20,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.all(size * 0.06),
                              itemCount: r.doctors!.length,
                              itemBuilder: (context, index) {
                                if (r.doctors![index].name == null ||
                                    r.doctors![index].specialization == null ||
                                    r.doctors![index].rating == null) {
                                  return SizedBox();
                                } else {
                                  return GestureDetector(
                                    child: DoctorTileWidget(
                                      size: size,
                                      rating: r.doctors![index].rating!,
                                      name: r.doctors![index].name!,
                                      designation:
                                          r.doctors![index].specialization!,
                                      imageUrl: 'assets/imgs/doctor.webp',
                                    ),
                                    onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => DoctorDetailsPage(
                                        model: Smodel(
                                          name: r.doctors![index].name!,
                                          education:
                                              r.doctors![index].education!,
                                          patients: r.doctors![index].patents!,
                                          exp: _parseExperience(r.doctors![index].experence!),
                                          about: r.doctors![index].about ?? '',
                                          rating: r.doctors![index].rating!,
                                          email: r.doctors![index].email!,
                                        ),
                                      ),
                                    )),
                                  );
                                }
                              },
                            );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

int _parseExperience(String experience) {
  final expMatch = RegExp(r'\d+').firstMatch(experience);
  if (expMatch != null) {
    return int.parse(expMatch.group(0)!);
  } else {
    return 0; // Default value if no numeric part is found
  }
}