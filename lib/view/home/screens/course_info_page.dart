import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/common_models/courses_model.dart';
import 'package:kids_edu_teacher/view/home/screens/lesson_info_page.dart';

class CourseInfoPage extends StatefulWidget {
  final Course course;
  static const routeName = '/coursesInfoScreen';

  const CourseInfoPage({super.key, required this.course});

  @override
  State<CourseInfoPage> createState() => _CourseInfoPageState();
}

class _CourseInfoPageState extends State<CourseInfoPage> {
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
          widget.course.name,
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
                        widget.course.cover.additionalParameters![2].cover3
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
                child: Text(
                  "${widget.course.lessons.length} ${tr('lessons')}",
                  style: TextStyles.s700r24Black,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: List.generate(
                  widget.course.lessons.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LessonInfoPage.routeName,
                            arguments: widget.course.lessons[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Pallate.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 85,
                        child: Row(
                          children: [
                            Container(
                              height: 85,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      widget.course.lessons[index].cover
                                          .additionalParameters![2].cover3
                                          .toString(),
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.course.lessons[index].name,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: TextStyles.s700r16Black,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Pallate.blueGradient1,
                                        child: SvgPicture.asset(
                                          "assets/icons/profile_filled.svg",
                                          color: Pallate.whiteColor,
                                          height: 15,
                                          width: 15,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "${tr('author')} ${widget.course.lessons[index].author.fullName}",
                                        style: TextStyles.s600r10Black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
