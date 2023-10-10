import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Pallate.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text("Добавить в корзину", style: TextStyles.s700r16White,),
    );
  }
}
