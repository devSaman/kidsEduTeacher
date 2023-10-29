import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/common_models/get_user_model.dart';

class PaymentCardWidget extends StatelessWidget {
  final UserCardsModel cardData;
  const PaymentCardWidget({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/user_card_image.png"),
                        fit: BoxFit.cover),
                    color: Pallate.redGradient1,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                  ),
                  height: 115,
                  width: 140,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "${cardData.number.toString().substring(0, 4)} **** **** ${cardData.number.toString().substring(12, 16)}",
                                  style: TextStyles.s700r18Black,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${cardData.type}  •  ${cardData.expiration.toString().substring(0,2)}/${cardData.expiration.toString().substring(2,4)} ",
                          style: TextStyles.s500r10Grey,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          cardData.name.toString(),
                          style: TextStyles.s500r10Grey,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: cardData.isMain!
                  ? Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Pallate.mainColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: 50,
                      height: 25,
                      child: Text(
                        tr('main'),
                        style: TextStyles.s600r12White,
                      ),
                    )
                  : const Center())
        ],
      ),
    );
  }
}
