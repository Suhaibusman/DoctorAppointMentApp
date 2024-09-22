import 'package:doctor_appointment_app/utils/widget/text_widget.dart';
import 'package:flutter/material.dart';

Widget customButtonWidget({
  required String text,
  required Function() onPressed,
  required Color fontColor,
  Color buttonColor =  Colors.blue,
  double buttonHeight = 43,
  double buttonWidth = double.infinity,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration:  BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
            child: customTextWidget(
          text: text,
          fontSize: 15,
          fontWeight: fontWeight,
          color: fontColor,
        ))),
  );
}
