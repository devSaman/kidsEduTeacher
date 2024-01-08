import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isFilled;
  const AddButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
              color: isFilled ? Colors.transparent : Pallate.greyColor),
          color: isFilled ? Pallate.mainColor : Pallate.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: isFilled ? TextStyles.s700r16White : TextStyles.s700r16Black,
        ),
      ),
    );
  }
}
