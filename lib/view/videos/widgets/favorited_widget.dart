import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';

class FavoritedVideoWidget extends StatelessWidget {
  final VideoModel video;
  final bool isLibrary;
  const FavoritedVideoWidget(
      {super.key, required this.isLibrary, required this.video});

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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      video.cover!.additionalParameters![2].cover3.toString(),
                    ),
                    fit: BoxFit.cover),
                color: Pallate.redGradient1,
                borderRadius: const BorderRadius.only(
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
                          Expanded(
                            child: Text(
                              video.name.toString(),
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
                    SizedBox(
                      width: 180,
                      child: Text(
                        "${video.favorited} likes • ${video.views} views",
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
