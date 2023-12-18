import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';

class CollectionWidget extends StatelessWidget {
  final VideoCollectionModel data;
  const CollectionWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  data.cover?.additionalParameters?[2].cover3?.toString() ?? '',
                ),
                fit: BoxFit.cover),
            color: Pallate.blueGradient2,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.2, 0.3, 0.9],
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
        Positioned(
          bottom: 12,
          left: 12,
          child: SizedBox(
            width: 150,
            child: Text(
              data.name.toString(),
              maxLines: 2,
              style: TextStyles.s700r16White,
            ),
          ),
        ),
      ],
    );
  }
}
