import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final VoidCallback onTap;
  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: color == Pallate.mainColor
            ? Text(
                text,
                style: TextStyles.s700r16White,
              )
            : Text(
                text,
                style: TextStyles.s700r16Main,
              ),
      ),
    );
  }
}
