import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/api_path.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/hive_models/basket_model.dart';

class BasketProductCardWidget extends StatelessWidget {
  final BasketModel product;
  const BasketProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Pallate.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      "${ApiPaths.basicUrl}/files/view?fileId=${product.image}",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(16),
              ),
              width: 80,
              height: 80,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.s600r14Black,
                  ),
                  Text(
                    "${product.attribute} | ${product.attributeValue}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.s400r14Grey,
                  ),
                ],
              ),
            ),
            Text(
              "${product.price} ${tr('coin')}",
              style: TextStyles.s600r14Black,
            )
          ],
        ),
      ),
    );
  }
}
