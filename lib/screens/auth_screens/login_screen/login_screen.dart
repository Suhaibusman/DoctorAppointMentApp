import 'package:doctor_appointment_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:doctor_appointment_app/screens/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:doctor_appointment_app/utils/constant/image_constant.dart';
import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
import 'package:doctor_appointment_app/utils/widget/button_widget.dart';
import 'package:doctor_appointment_app/utils/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.onBoardingTexture),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),

              // Email TextField
              CustomTextField(
                hintText: 'Email',
                controller: emailController,
                icon: Icons.email,
              ),
              SizedBox(height: 20),

              // Password TextField
              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
                icon: Icons.lock,
              ),
              SizedBox(height: 30),

              // Login Button
              customButtonWidget(text: "Login", onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar(),));
              }, fontColor: primaryColor , buttonColor: Colors.white , buttonHeight: 60 ,  fontWeight: FontWeight.w600),
              SizedBox(height: 20),

              // Signup Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
