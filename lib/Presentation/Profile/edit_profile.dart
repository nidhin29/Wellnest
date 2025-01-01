import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Application/edit_profile/editprofile_cubit.dart';
import 'package:wellnest/Application/home/home_cubit.dart';
import 'package:wellnest/Application/profile/profile_cubit.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Profile/profile_model.dart';
import 'package:wellnest/Presentation/common%20widgets/snackbar.dart';
import 'package:wellnest/Presentation/constants/loading.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: "XXXX");

  final TextEditingController _ageController =
      TextEditingController(text: "00");

  final TextEditingController _weightController =
      TextEditingController(text: "00");

  final ValueNotifier<String> _genderNotifier = ValueNotifier("Male");

  final TextEditingController _facebookController =
      TextEditingController(text: "XXXX");

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return BlocConsumer<EditprofileCubit, EditprofileState>(
      listener: (context, state) {
        state.isFailureOrSuccessForUpdate.fold(
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
                      context: context, text: "Something Unexpected Happened");
                }
              }
            },
            (r) {
              BlocProvider.of<ProfileCubit>(context).getProfile();
              BlocProvider.of<HomeCubit>(context).getDetails();
              Navigator.of(context).pop();
            },
          ),
        );
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            body: Center(
              child: spinkit,
            ),
          );
        }
        return BlocConsumer<ProfileCubit, ProfileState>(
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
                  _nameController.text =
                      r.name == null || r.name == '' ? "XXXX" : r.name!;
                  _ageController.text =
                      r.age == null || r.age == '' ? "00" : r.age!.toString();
                  _weightController.text =
                      r.address == null || r.address == '' ? "00" : r.address!;
                  _facebookController.text =
                      r.apiKey == null || r.apiKey == '' ? "XXXX" : r.apiKey!;
                  _genderNotifier.value =
                      r.gender == null || r.gender == '' ? 'Male' : r.gender!;
                },
              ),
            );
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Scaffold(
                body: Center(
                  child: spinkit,
                ),
              );
            }

            state.isFailureOrSuccessForGet.fold(() {
              return const Center(child: Text('Error...'));
            }, (either) {
              either.fold((failure) {
                if (failure == const MainFailure.clientFailure()) {
                  return const Center(child: Text('Network Error...'));
                } else if (failure == const MainFailure.serverFailure()) {
                  return const Center(child: Text('Server Error...'));
                } else {
                  const Center(child: Text('Impossible Error...'));
                }
              }, (r) {});
            });
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text('Edit Profile',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ))),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: size * 0.02, bottom: size * 0.01),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<EditprofileCubit>(context)
                            .updateProfile(
                                profileModel: ProfileModel(
                                    _genderNotifier.value,
                                    age: int.parse(_ageController.text),
                                    facebookApi: _facebookController.text,
                                    weightAddress: _weightController.text,
                                    name: _nameController.text));
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            color: Color.fromARGB(255, 66, 159, 69),
                            fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    _TextFieldWithTitle(
                      title: "Name",
                      controller: _nameController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size * 0.56),
                      child: _DropdownWithTitle(
                        title: "Gender",
                        items: const [
                          "Male",
                          "Female",
                        ],
                        selectedValue: _genderNotifier,
                      ),
                    ),
                    _TextFieldWithTitle(
                      title: "Age",
                      controller: _ageController,
                    ),
                    _TextFieldWithTitle(
                      title: "Weight",
                      controller: _weightController,
                    ),
                    _TextFieldWithTitle(
                      title: "Facebook API Key",
                      controller: _facebookController,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                )),
              ),
            );
          },
        );
      },
    );
  }
}

class _TextFieldWithTitle extends StatelessWidget {
  const _TextFieldWithTitle({required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, height: 0.1),
        ),
        TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}

class _DropdownWithTitle extends StatefulWidget {
  final String title;
  final List<String> items;
  final ValueNotifier<String> selectedValue;

  const _DropdownWithTitle(
      {required this.title, required this.items, required this.selectedValue});

  @override
  _DropdownWithTitleState createState() => _DropdownWithTitleState();
}

class _DropdownWithTitleState extends State<_DropdownWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, height: 0.1),
        ),
        ValueListenableBuilder(
            valueListenable: widget.selectedValue,
            builder: (context, value, child) {
              return DropdownButton<String>(
                isExpanded: true,
                value: widget.selectedValue.value,
                underline: Container(
                  height: 1,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    widget.selectedValue.value = newValue!;
                  });
                },
                items:
                    widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                  );
                }).toList(),
              );
            }),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
