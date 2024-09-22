import 'package:doctor_appointment_app/utils/constant/app_constant.dart';
import 'package:doctor_appointment_app/utils/constant/image_constant.dart';
import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
import 'package:doctor_appointment_app/utils/widget/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.35,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            image: DecorationImage(
              image: AssetImage(ImageConstant.homeTexture),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(

              children: [
                largeSpaceh,
                mediumSpaceh,
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/userImage.png"),
                    ),
                    smallSpacew,
                    Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customTextWidget(
                          text: "Hello, Welcome 🎉",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        customTextWidget(
                          text: "Savannah Nguyen",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ],
                    ) ,
                     const Spacer(),
                    Image.asset(ImageConstant.notificationIcon , height: 40,)


                  ],
                ),
                Image.asset(ImageConstant.textField ,  width: double.infinity,)
              ],
            ),
          )
        ),
      ],
    ),
    );
  }
}
