import 'package:doctor_appointment_app/utils/constant/image_constant.dart';
import 'package:doctor_appointment_app/utils/widget/text_widget.dart';
import 'package:flutter/material.dart';

Widget customButtonWidget({
  required String text,
  required Function() onPressed,
  required Color fontColor,
  double buttonHeight = 43,
  double buttonWidth = 129,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.bottomSheetButton),
            fit: BoxFit.contain,
          ),
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