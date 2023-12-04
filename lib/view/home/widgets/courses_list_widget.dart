import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/common_models/courses_model.dart';
import 'package:kids_edu_teacher/view/home/screens/course_info_page.dart';
import 'package:kids_edu_teacher/view/home/screens/courses_list.dart';

class CoursesListWidget extends StatelessWidget {
  final List<Course> courses;
  const CoursesListWidget({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr("courses"),
                style: TextStyles.s700r22Black,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CoursesListPage.routeName,
                      arguments: courses);
                },
                child: Row(
                  children: [
                    Text(
                      tr("see_all"),
                      style: TextStyles.s700r18Main,
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: Pallate.mainColor,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CourseInfoPage.routeName,
                            arguments: courses[index]);
                      },
                      child: Container(
                        width: 200,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Pallate.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 200,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          courses[index]
                                              .cover
                                              .additionalParameters![2]
                                              .cover3
                                              .toString(),
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 12,
                                  right: 12,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Pallate.mainColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      "${courses[index].lessons.length} ${tr('lessons')}",
                                      style: TextStyles.s600r10White,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                courses[index].name,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: TextStyles.s700r16Black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 12),
                              child: Row(
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
                                    "${tr('author')} ${courses[index].author.fullName}",
                                    style: TextStyles.s600r10Black,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
