import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class AddChildButton extends StatelessWidget {
  const AddChildButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(
              'assets/images/main_button.png',
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 22, left: 28, bottom: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 220,
              child: Text(
                tr('add_course_info'),
                style: TextStyles.s700r16White,
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   width: 110,
            //   height: 32,
            //   decoration: BoxDecoration(
            //     color: Pallate.whiteColor,
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: Text("${tr('add')} +", style: TextStyles.s600r14Main,),
            // )
          ],
        ),
      ),
    );
  }
}
