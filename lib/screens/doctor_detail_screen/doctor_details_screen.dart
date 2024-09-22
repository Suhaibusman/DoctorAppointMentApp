import 'package:doctor_appointment_app/domain/doctor_model.dart';
import 'package:doctor_appointment_app/utils/constant/app_constant.dart';
import 'package:doctor_appointment_app/utils/widget/text_widget.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final DoctorModel doctorModel;
  const DoctorDetailsScreen({super.key , required this.doctorModel});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          largeSpaceh,
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Spacer(),
                customTextWidget(text: "My Appointments", fontSize: 16, fontWeight: FontWeight.w600),
                Spacer(),
              ]

            ),
          ),
          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height *0.5,
              width: MediaQuery.of(context).size.width *0.9,// Add horizontal padding for spacing
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height *0.35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.doctorModel.doctorImage),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10) , topLeft: Radius.circular(10))                              ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15 , top: 20),
                            child: customTextWidget(
                              text: widget.doctorModel.doctorName,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: customTextWidget(
                              text: widget.doctorModel.speciality,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),

                        ],
                      ),
                      Wrap(
                        children: [
                          Icon(
                            Icons.star_purple500_outlined,
                            color: Color(0xffFFD33C),
                            size: 16,
                          ),
                          customTextWidget(
                            text: widget.doctorModel.rating.toString(),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ],
                      )
                    ],
                  ),


                ],
              )
          )
          
        ],
      ),
    );
  }
}
