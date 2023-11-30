import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/common_models/courses_model.dart';
import 'package:kids_edu_teacher/view/home/screens/lesson_content_page.dart';
import 'package:kids_edu_teacher/view/home/screens/lesson_slider.dart';

class LessonInfoPage extends StatefulWidget {
  final Lesson lesson;
  static const routeName = '/lessonInfoScreen';

  const LessonInfoPage({super.key, required this.lesson});

  @override
  State<LessonInfoPage> createState() => _LessonInfoPageState();
}

class _LessonInfoPageState extends State<LessonInfoPage> {
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
        title: Text(
          widget.lesson.name,
          style: TextStyles.s700r24Black,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        widget.lesson.cover.additionalParameters![2].cover3
                            .toString(),
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 230,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.lesson.name,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: TextStyles.s700r24Black,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Pallate.green,
                          child: SvgPicture.asset(
                            "assets/icons/profile_filled.svg",
                            color: Pallate.whiteColor,
                            height: 25,
                            width: 25,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "${tr('author')} ${widget.lesson.author.fullName}",
                          style: TextStyles.s700r18Black,
                        ),
                      ],
                    ),
                    const SizedBox(height: 52),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, LessonContrentPage.routeName,
                                arguments: widget.lesson.lessonContent);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Pallate.blackColor.withOpacity(.1)),
                              color: Pallate.greyColor.withOpacity(.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/lesson_content.png',
                                  width: 48,
                                  height: 48,
                                ),
                                const Text(
                                  "Lesson Content",
                                  style: TextStyles.s700r18Black,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, LessonSliderPage.routeName,
                                arguments: widget.lesson.slides);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Pallate.blackColor.withOpacity(.1)),
                              color: Pallate.greyColor.withOpacity(.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/lesson_slider.png',
                                  width: 48,
                                  height: 48,
                                ),
                                const Text(
                                  "Slider",
                                  style: TextStyles.s700r18Black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
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
