import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class ShopProductCard extends StatelessWidget {
  final bool isWidth;
  const ShopProductCard({super.key, required this.isWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isWidth? 150 :null,
      decoration: BoxDecoration(
        border: Border.all(color: Pallate.mainColor),
        color: Pallate.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Pallate.mainColor,
              borderRadius: BorderRadius.circular(16),
            ),
            width: double.infinity,
            height: 130,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Sneakers",
              style: TextStyles.s600r13black,
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 6,
                  backgroundColor: Pallate.redGradient1,
                ),
                Text(
                  "530 000",
                  style: TextStyles.s600r13black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
