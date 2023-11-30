import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';

class LessonSliderPage extends StatefulWidget {
  final List<VideoCoverModel> slides;
  static const routeName = '/lessonSliderScreen';

  const LessonSliderPage({super.key, required this.slides});

  @override
  State<LessonSliderPage> createState() => _LessonSliderPageState();
}

class _LessonSliderPageState extends State<LessonSliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Pallate.blackColor,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Slider",
          style: TextStyles.s700r24Black,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: List.generate(
                  widget.slides.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              widget
                                  .slides[index].additionalParameters![2].cover3
                                  .toString(),
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      height: 230,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
