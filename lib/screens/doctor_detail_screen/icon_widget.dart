import 'package:doctor_appointment_app/utils/constant/app_constant.dart';
import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
import 'package:doctor_appointment_app/utils/widget/text_widget.dart';
import 'package:flutter/material.dart';

Widget customIconWidget(
    {
      required String imageIcon,
      required String fieldValue,
      required String headingValue,
  }) {
  return  Column(
    children: [
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageIcon),
            fit: BoxFit.cover,
          ),

        ),
      ),
      smallSpaceh,
      customTextWidget(
        text: fieldValue,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),

      customTextWidget(
        text: headingValue,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: lighterColor,
      ),
    ],
  );
}
