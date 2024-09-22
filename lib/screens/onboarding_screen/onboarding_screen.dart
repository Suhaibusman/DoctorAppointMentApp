import 'package:doctor_appointment_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:doctor_appointment_app/screens/home_screen/home_screen.dart';
import 'package:doctor_appointment_app/utils/constant/app_constant.dart';
import 'package:doctor_appointment_app/utils/constant/image_constant.dart';
import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
import 'package:doctor_appointment_app/utils/widget/button_widget.dart';
import 'package:doctor_appointment_app/utils/widget/text_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
        Container(
          height: MediaQuery.of(context).size.height*0.6,
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryColor,
              image: const DecorationImage(
                  image: AssetImage(ImageConstant.onBoardingTexture),
                  fit: BoxFit.cover
              )
          ),

          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(ImageConstant.doctorImage1 , height: 350,),
          ),
        ),
          Container(
             height: MediaQuery.of(context).size.height*0.4,
             // width: double.infinity,
       decoration: const BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )
       ),
            child: Padding(padding: const EdgeInsets.all(20),
            child:  Column(
    children: [
    Padding(
      padding: const EdgeInsets.only(left: 20 , right: 20),
      child: customTextWidget(text: "More Comfortable Chat With the Doctor" , fontSize: 24 , fontWeight: FontWeight.w600 , textAlign: TextAlign.center , lineHeight: 1.5),
    ),
      mediumSpaceh,
      Padding(
        padding: const EdgeInsets.only(left: 20 , right: 20),
        child: customTextWidget(text: "Book an appointment with doctor. Chat with doctor via appointment letter and get consultationt." , fontSize: 14 , fontWeight: FontWeight.w200 , textAlign: TextAlign.center , lineHeight: 1.5),
      ), 
      mediumSpaceh,
      const Spacer(),
      customButtonWidget(text: "Get Started", onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  BottomNavBar(),));
      }, fontColor: Colors.white , buttonColor: primaryColor , buttonHeight: 50 ,  fontWeight: FontWeight.w600)
    ],
    )
            )
          ),


        ],
      ),
    );
  }
}
