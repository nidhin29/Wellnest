import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/Appointments/appointment.dart';
import 'package:wellnest/Presentation/Messages/messages.dart';
import 'package:wellnest/Presentation/common%20widgets/doctor_info.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

class DoctorDetailsPage extends StatelessWidget {
  final Smodel model;
  const DoctorDetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: size * 0.2,
            backgroundColor: maincolor,
            child: Text(
              getName(model.name!),
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
          Column(
            children: [
              Text(
                model.name!,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                )),
              ),
              SizedBox(
                width: size * 0.8,
                child: Text(
                  model.education!,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Color.fromARGB(255, 112, 111, 111),
                    fontSize: 15,
                  )),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size * 0.03),
            child: DoctorInfo(
              patients: model.patients!,
              exp: model.exp!,
              raring: model.rating!,
            ),
          ),
          Column(
            children: [
              Text(
                'About Doctor',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                )),
              ),
              kheight10,
              SizedBox(
                width: size * 0.9,
                child: Text(
                  model.about!,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Color.fromARGB(255, 112, 111, 111),
                    fontSize: 15,
                  )),
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AppointmentPage(email: model.email!,),
              ));
            },
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: const WidgetStatePropertyAll(maincolor),
              minimumSize:
                  WidgetStateProperty.all(Size(size * 0.92, size * 0.15)),
            ),
            child: const Text(
              'Book Appointment',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}

class Smodel {
  final String? name;
  final String? education;
  final int? patients;
  final int? exp;
  final int? rating;
  final String? about;
  final String? email;

  Smodel(
      {required this.name,
      required this.email,
      required this.education,
      required this.patients,
      required this.exp,
      required this.rating,
      required this.about});
}
