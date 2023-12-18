import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/common_models/courses_model.dart';
import 'package:kids_edu_teacher/view/home/screens/course_info_page.dart';

class CoursesListPage extends StatefulWidget {
  final List<Course> courses;
  static const routeName = '/coursesListScreen';

  const CoursesListPage({super.key, required this.courses});

  @override
  State<CoursesListPage> createState() => _CoursesListPageState();
}

class _CoursesListPageState extends State<CoursesListPage> {
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
          tr("courses"),
          style: TextStyles.s700r24Black,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: List.generate(
            widget.courses.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CourseInfoPage.routeName,
                      arguments: widget.courses[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Pallate.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  height: 140,
                  child: Row(
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                widget.courses[index].cover
                                    .additionalParameters![2].cover3
                                    .toString(),
                              ),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.courses[index].name,
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
                                  "${tr('author')} ${widget.courses[index].author.fullName}",
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
      ),
    );
  }
}
