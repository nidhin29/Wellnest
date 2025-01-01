import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wellnest/Application/message/message_cubit.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Presentation/Messages/chat.dart';
import 'package:wellnest/Presentation/common%20widgets/snackbar.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final bloc = BlocProvider.of<MessageCubit>(context).state;
      bloc.isFailureOrSuccess.fold(() {
        BlocProvider.of<MessageCubit>(context).getMessages();
      }, (either) {
        either.fold((l) {
          BlocProvider.of<MessageCubit>(context).getMessages();
        }, (r) {});
      });
    });
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Messages',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kheight10,
            Padding(
              padding: EdgeInsets.only(left: size * 0.05),
              child: Text('Recent Chat',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ))),
            ),
            kheight20,
            BlocConsumer<MessageCubit, MessageState>(
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
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 0, 0, 0),
                            highlightColor:
                                const Color.fromARGB(255, 207, 207, 207),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  const Color.fromARGB(34, 0, 0, 0),
                            ),
                          ),
                          title: Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 0, 0, 0),
                            highlightColor:
                                const Color.fromARGB(255, 207, 207, 207),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 120),
                              child: Container(
                                height: 20,
                                width: 10,
                                color: const Color.fromARGB(34, 0, 0, 0),
                              ),
                            ),
                          ),
                          // subtitle: Text('Hey, how are you?',
                          //     style: GoogleFonts.poppins(
                          //         textStyle: const TextStyle(
                          //       color: Colors.grey,
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.w400,
                          //     ))),
                          // trailing: Text('10:30 AM',
                          //     style: GoogleFonts.poppins(
                          //         textStyle: const TextStyle(
                          //       color: Colors.grey,
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.w400,
                          //     ))),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: size * 0.05,
                              right: size * 0.05,
                              top: size * 0.02),
                          child: const Divider(),
                        );
                      },
                      itemCount: 8);
                }
                return state.isFailureOrSuccess.fold(() {
                  return Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Center(
                      child: Text(
                        'No Recent Chats',
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
                }, (either) {
                  return either.fold((l) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(
                        child: Text(
                          'No Recent Chats',
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
                  }, (r) {
                    return r.chats == null || r.chats!.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 150),
                            child: Center(
                              child: Text(
                                'No Recent Chats',
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
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                      id: r.chats![index].id!,
                                      name: r.chats![index].doctorName!,
                                    ),
                                  ));
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: maincolor,
                                    child: Text(
                                      getName(r.chats![index].doctorName!),
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ),
                                  ),
                                  title: Text(r.chats![index].doctorName!,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ))),
                                  // subtitle: Text('Hey, how are you?',
                                  //     style: GoogleFonts.poppins(
                                  //         textStyle: const TextStyle(
                                  //       color: Colors.grey,
                                  //       fontSize: 15,
                                  //       fontWeight: FontWeight.w400,
                                  //     ))),
                                  // trailing: Text('10:30 AM',
                                  //     style: GoogleFonts.poppins(
                                  //         textStyle: const TextStyle(
                                  //       color: Colors.grey,
                                  //       fontSize: 15,
                                  //       fontWeight: FontWeight.w400,
                                  //     ))),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: size * 0.05, right: size * 0.05),
                                child: const Divider(),
                              );
                            },
                            itemCount: r.chats!.length);
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

String getName(String name) {
  for (int i = 0; i < name.length; i++) {
    if (name[i] == ' ') {
      return name[i + 1];
    }
  }
  return 'D';
}
