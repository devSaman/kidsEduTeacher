import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/api_path.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/shop_models/main_model.dart';

class ShopProductCard extends StatelessWidget {
  final ProductModel product;
  final bool isWidth;
  const ShopProductCard(
      {super.key, required this.isWidth, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isWidth ? 150 : null,
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
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    "${ApiPaths.basicUrl}/files/view?fileId=${product.images[0]}",
                    
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(16),
            ),
            width: double.infinity,
            height: 130,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              product.name,
              style: TextStyles.s600r13black,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 6,
                  backgroundColor: Pallate.redGradient1,
                ),
                Text(
                  "${product.price} ${tr('coins')}",
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
