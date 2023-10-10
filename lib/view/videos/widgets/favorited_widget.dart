import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';


class FavoritedVideoWidget extends StatelessWidget {
  final bool isLibrary;
  const FavoritedVideoWidget({super.key, required this.isLibrary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              "Can You Imagine, World data",
                              style: TextStyles.s700r18Black,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/star.svg',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const SizedBox(
                      width: 180,
                      child: Text(
                        "3K likes • 4.9K views",
                        style: TextStyles.s500r10Grey,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 12),
                    isLibrary
                        ? SizedBox(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/read.svg',
                                ),
                                SvgPicture.asset(
                                  'assets/icons/download.svg',
                                ),
                              ],
                            ),
                          )
                        : const Center()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
