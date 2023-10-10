import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';


class CollectionWidget extends StatelessWidget {
  const CollectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Pallate.blueGradient2,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5, 0.6, 0.9],
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.black12,
                Colors.black54,
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const Positioned(
          bottom: 12,
          left: 12,
          child: Text(
            "Name",
            style: TextStyles.s700r16White,
          ),
        ),
      ],
    );
  }
}
