import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
        Container(
          height: 300,
          width: double.infinity,
          color: primaryColor,
          child: Center(
            child: Text('Onboarding Screen'),
          ),
        ),


        ],
      ),
    );
  }
}
