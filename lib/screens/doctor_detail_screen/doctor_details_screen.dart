import 'package:doctor_appointment_app/domain/doctor_model.dart';
import 'package:doctor_appointment_app/screens/call_screen/call_screen.dart';
import 'package:doctor_appointment_app/screens/doctor_detail_screen/icon_widget.dart';
import 'package:doctor_appointment_app/utils/constant/app_constant.dart';
import 'package:doctor_appointment_app/utils/constant/image_constant.dart';
import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                  customTextWidget(text: "My Appointments", fontSize: 18, fontWeight: FontWeight.w700),
                  const Spacer(),
                ]
        
              ),
            ),
            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height *0.45,
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
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(10) , topLeft: Radius.circular(10))                              ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15 , top: 20),
                              child: customTextWidget(
                                text: widget.doctorModel.doctorName,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15 , top: 5),
                              child: customTextWidget(
                                text: "${widget.doctorModel.speciality} | ${widget.doctorModel.clinicName}",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: lighterColor,
                              ),
                            ),
        
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            children: [
                              const Icon(
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
                              customTextWidget(
                                text: "(${widget.doctorModel.totalReviews.toString()} reviews)",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: lighterColor,
                              )
                            ],
                          ),
                        )

                      ],
                    ),
        
        
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20 ,top: 20 ,),
              child: Container(

                decoration: BoxDecoration(
                  // color: lighterColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 20 ,top: 20 ,),
                          child: customIconWidget(
                            imageIcon: ImageConstant.patientIcon,
                            fieldValue: "${widget.doctorModel.patients.toString()}+",
                            headingValue: "Patients",
                          ),
                        ),
                        Padding(
                          padding:const EdgeInsets.only(left: 20 ,top: 20 ,),
                          child: customIconWidget(
                            imageIcon: ImageConstant.experienceIcon,
                            fieldValue: "${widget.doctorModel.experience.toString()}+",
                            headingValue: "Years Exp",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20 ,top: 20 ,),
                          child: customIconWidget(
                            imageIcon: ImageConstant.ratingIcon,
                            fieldValue: "${widget.doctorModel.rating.toString()}",
                            headingValue: "Rating",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20 ,top: 20 ,),
                          child: customIconWidget(
                            imageIcon: ImageConstant.reviewsIcon,
                            fieldValue: "${widget.doctorModel.totalReviews.toString()}+",
                            headingValue: "Reviews",
                          ),
                        ),
                      ],
                    ),
                    mediumSpaceh,
                    customTextWidget(text: "About Me", fontSize: 16, fontWeight: FontWeight.w600),
                    mediumSpaceh,
                    customTextWidget(text: widget.doctorModel.about, fontSize: 14, fontWeight: FontWeight.w400 , color: lighterColor, lineHeight: 1.5),
                  ],
                ),
              ),
            ),
        
            
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CallScreen(doctorModel: widget.doctorModel,)));
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(ImageConstant.callButton),
                fit: BoxFit.cover,

              ),
              borderRadius: BorderRadius.circular(15),

            ),
          )
        ),
      ),
    );
  }
}
